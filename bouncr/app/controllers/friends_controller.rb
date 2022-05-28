class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]
  before_action :authorized
  wrap_parameters format: [:json]

  # GET /friends
  def index
    @friends = Friend.all
    render json: @friends
  end

  # GET /friends/1
  def show
    render json: @friend
  end

  # POST /friends
  def create
    #@friend = Friend.new(friend_params)
    @friend = Friend.new(user1_id: params[:user1_id], user2_id: params[:user2_id], accepted: false)
    if @friend.save
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

  # PATCH/PUT 
  def update
    if @friend.update(accepted: params[:accepted])
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

  # DELETE /friends/1
  def destroy
    if @friend.destroy
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find_by(user1_id: params[:user1_id], user2_id: params[:user2_id])
    end

    # Only allow a list of trusted parameters through.
    # def friend_params
    #   params.require(:friend).permit(:user1_id, :user2_id, :accepted)
    # end
end

