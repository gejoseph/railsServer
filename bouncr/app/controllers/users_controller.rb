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
      render json: {
        user: @user.as_json(:except => [:password_digest, :created_at, :updated_at]), 
        token: token
      }
    else
      render json: {
        returnValue: -1,
        returnString: "Invalid username or password"
      }
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

  # GET /event_guests/
  def event_guests
    @users = User.for_invited(params[:id], params[:invite_status])
    if params[:checked_in].to_s.downcase == "true"
      @users = @users.checked_in
    else
      @users = @users.not_checked_in
    end

    @friends = User.initiated_friendship(params[:user_id], true) + (User.recieved_friendship(params[:id], true))

    if params[:is_friend].to_s.downcase == "true"
      @users = @users & @friends
    elsif params[:is_friend].to_s.downcase == "false"
      @users = @users - @friends
    end

    render json: UserBlueprint.render(@users, view: :other_user)
  end

  # GET /users_search
  def index_for_search
    @users = User.search(params[:term])
    render json: UserBlueprint.render(@users, view: :other_user)
  end

  # GET /user_friends
  def index_friends
    @users = User.initiated_friendship(params[:id],true) + (User.recieved_friendship(params[:id],true))
    render json: UserBlueprint.render(@users, view: :other_user)
  end

  # GET /user_friends
  def index_friend_requests
    @users = []
    if params[:sentByMe].to_s.downcase == "true"
      @users = User.initiated_friendship(params[:id], false)
    else
      @users = User.recieved_friendship(params[:id], false)
    end 
    render json: UserBlueprint.render(@users, view: :other_user)
  end

  # PUT /users/:id
  def update
    if @user.update(user_params)
      token = encode_token({user_id: @user.id})
      render json: {
        user: @user.as_json(:except => [:password_digest, :created_at, :updated_at]), 
        token: token
      }
    else
      render json: {
        returnValue: -1,
        returnString: "Invalid update"
      }
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    if !@user.destroyed?
      render json: {
        returnValue: -1,
        returnString: "Invalid destroy"
      }
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
      render json: {
        user: @user.as_json(:except => [:password_digest, :created_at, :updated_at]),
        token: token
      }
    else
      render json: {
        returnValue: -1,
        returnString: "Invalid username or password"
      }
    end
  end

  # GET /auto_login
  def auto_login
    render json: UserBlueprint.render(@user, view: :normal)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:username, :password, :email, :firstName, :lastName, :phoneNumber, :birthday)
    end

end
