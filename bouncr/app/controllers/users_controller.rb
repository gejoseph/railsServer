class UsersController < ApplicationController

  before_action :authorized, only: [:auto_login, :destroy,:update]
  before_action :set_user, only: [:show, :update, :destroy]
  wrap_parameters format: [:json]

  # REGISTER
  # POST /users
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # GET /users/:id
  def show
    render json: UserBlueprint.render(@user, view: :normal)
  end

  # GET /event_hosts/:id
  def event_hosts
    @users = User.for_hosting(params[:id])
    render json: UserBlueprint.render(@users, view: :other_user)
  end

  # GET /event_guests/:id
  def event_guests
    @users = User.for_invited(params[:id], params[:inviteStatus])
    render json: UserBlueprint.render(@users, view: :other_user)
  end

  # GET /users_search
  def index_for_search
    @users = User.search(params[:term])
    render json: UserBlueprint.render(@users, view: :other_user)
  end

  # What is this for??? No matching route
  def index_friends
    @users = User.initiatedFriendship(params[:id]) + (User.recievedFriendship(params[:id]))
    # @remaining_users = User.all - @users #dont know if we need this
    render json: UserBlueprint.render(@users, view: :other_user)
  end

  # PUT /users/:id
  def update
    if @user.update(user_params)
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
    else
        render json: {error: "Invalid update"}
    end
  end

  def destroy
    @user.destroy
    if !@user.destroyed?
      render json: {error: "Invalid destroy"}
    end
  end

  # GET /users
  def index
    @users = User.all
    render json: UserBlueprint.render(@users, view: :normal)
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: UserBlueprint.render(@user, view: :normal)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :password, :email,:firstName,:lastName,:phoneNumber)
  end

end
