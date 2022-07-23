class UsersController < ApplicationController

  before_action :authorized, only: [:auto_login, :destroy, :index_for_search]
  before_action :set_user_and_authorize, only: [:show, :update, :destroy, :index_friends, :index_friend_requests]
  before_action :set_event_and_authorize, only: [:event_guests, :event_hosts]
  wrap_parameters format: [:json]

  # REGISTER
  # POST /users
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: UserBlueprint.render(@user, view: :login, token: token)
    else
      render json: {
        returnValue: -1,
        returnString: "Invalid username or password"
      }
    end
  end

  # GET /users/:id
  def show
    render json: UserBlueprint.render(@user_target, view: :normal)
  end

  # GET /event_hosts/:id
  def event_hosts
    @users = User.for_hosting(params[:id])
    render json: UserBlueprint.render(@users, view: :other_user)
  end

  # GET /event_guests/
  def event_guests
    @users = User.for_invited_event(params[:id])

    if params[:invite_status].to_s.downcase == "true" || params[:invite_status].to_s.downcase == "false" 
      @users = @users.for_invited_status(params[:invite_status].to_s.downcase == "true")
    end
    
    if params[:checked_in].to_s.downcase == "true"
      @users = @users.checked_in
    elsif params[:checked_in].to_s.downcase == "false"
      @users = @users.not_checked_in
    end

    @friends = User.initiated_friendship(params[:user_id], true) + (User.recieved_friendship(params[:user_id], true))

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

  # GET /user_friend_requests
  def index_friend_requests
    @users = []
    if params[:sent_by_me].to_s.downcase == "true"
      @users = User.initiated_friendship(params[:id], false)
    else
      @users = User.recieved_friendship(params[:id], false)
    end 
    render json: UserBlueprint.render(@users, view: :other_user)
  end

  # PUT /users/:id
  def update
    if @user_target.update(user_params)
      token = encode_token({user_id: @user_target.id})
      render json: UserBlueprint.render(@user_target, view: :login, token: token)
    else
      render json: {
        returnValue: -1,
        returnString: "Invalid update"
      }
    end
  end

  # DELETE /users/:id
  #we currently do not allow it at all
  def destroy
    if @user_target.destroy
      render json: {
        returnValue: 0,
        returnString: "success"
      }
    else
      render json: {
        returnValue: -1,
        returnString: "failure"
      }
    end
  end

  # GET /users
  def index
    #we only allow admins to index
    @users = policy_scope(User)
    render json: UserBlueprint.render(@users, view: :normal)
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: UserBlueprint.render(@user, view: :login, token: token)
    else
      render json: {
        returnValue: -2,
        returnString: "Invalid username or password"
      }
    end
  end

  # GET /auto_login
  def auto_login
    render json: UserBlueprint.render(@user, view: :normal)
  end

  private
  #set the user based on the ID, also ensures that 
    def set_user_and_authorize
      @user_target = User.find(params[:id])
      authorize @user_target
    end

    def set_event_and_authorize
      @target_event = Event.find(params[:id])
      authorize @target_event
    end

    def user_params
      params.permit(:username, :password, :email, :firstName, :lastName, :phoneNumber, :birthday)
    end

end
