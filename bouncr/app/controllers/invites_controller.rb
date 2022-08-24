class InvitesController < ApplicationController
  before_action :set_invite_and_authorize, only: [:show, :update, :destroy]
  before_action :set_user_and_authorize, only: [:guest_invites]
  #before_action :authorized
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  wrap_parameters format: [:json]

  # GET /invites
  def index
    @invites = policy_scope(Invite)
    render json: InviteBlueprint.render(@invites, view: :normal)
  end

  # GET /guest_invites
  def guest_invites
    @invites = Invite.by_user(params[:id])
    render json: InviteBlueprint.render(@invites, view: :with_event)
    #render json: InviteBlueprint.render(@invites, view: :normal)
  end

  # GET /invites/1
  def show
    render json: InviteBlueprint.render(@invite, view: :normal)
  end

  # POST /invites
  def create
    @invite = Invite.new(invite_params)
    authorize @invite
    if @invite.save
      render json: InviteBlueprint.render(@invite, view: :normal)
    else
      render json: {
        returnValue: -1,
        returnString: "failure"
      }
    end
  end

  # PATCH/PUT /invites/1
  def update
    # Render response JSON b/c frontend doesn't need to know invite details on update
    if @invite.update(invite_params)
      render json: InviteBlueprint.render(@invite, view: :normal)
    else
      render json: {
        returnValue: -1,
        returnString: "failure"
      }
    end
  end

  # DELETE /invites/1
  def destroy
    if @invite.destroy
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
    def set_invite_and_authorize
      @invite = Invite.find(params[:id])
      authorize @invite
    end

    # Only allow a list of trusted parameters through.
    def invite_params
      params.require(:invite).permit(:user_id, :event_id, :checkinTime, :inviteStatus, :checkinStatus, :coverChargePaid)
    end
end
