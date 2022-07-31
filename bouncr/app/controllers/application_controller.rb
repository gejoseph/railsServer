class ApplicationController < ActionController::API
    before_action :authorized
    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def encode_token(payload)
    JWT.encode(payload, 'yourSecret')
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: {returnValue: -2,
      returnString: "Invalid token"}, status: :unauthorized unless logged_in?
  end

  #return authorized user, this may securely replace authorized if you are using the authorization policy 
  def current_user
    loggedInUser = logged_in_user
    if !loggedInUser
      render json:{returnValue: -2,
        returnString: "Invalid token"}
    end
    return loggedInUser
  end

    #set the user based on the ID, also ensures that 
    def set_user_and_authorize
      @user_target = User.find(params[:id])
      authorize @user_target
    end

    def set_event_and_authorize
      @target_event = Event.find(params[:id])
      authorize @target_event
    end

  private

  def user_not_authorized
    render json:{returnValue: -5,
      returnString: "Inproper permission"}
  end
end
