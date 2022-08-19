class EventsController < ApplicationController
  before_action :set_event_and_authorize, only: [:show, :update, :destroy]
  before_action :set_user_and_authorize, only: [:host_events, :create_with_host]
  #before_action :authorized
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  wrap_parameters format: [:json]

  # GET /events
  def index
    @events = policy_scope(Event)
    render json: EventBlueprint.render(@events, view: :normal)
  end

  # GET /host_events/:id
  def host_events
    @events = Event.forHost(params[:id]).alphabetical
    #render json: EventBlueprint.render(@events, view: :normal)
    render json: EventBlueprint.render(@events, view: :withAttendance)
  end

  # GET /events/1
  def show
    render json: EventBlueprint.render(@target_event, view: :show)
  end

  # POST /events
  def create_with_host
    @event = Event.new(event_params)
    if @event.save
      if Host.create(user: User.find(params[:id]), event: @event)
        render json: EventBlueprint.render(@event, view: :show)
      else
        @event.destroy
        render json: {
          returnValue: -1,
          returnString: "unable to create host, deleting event too"
        }
      end
    else
      render json: {
        returnValue: -1,
        returnString: "unable to create event"
      }
    end
  end

  # PATCH/PUT /events/:id
  def update
    if @target_event.update(event_params)
      render json: EventBlueprint.render(@target_event, view: :show)
    else
      render json: {
        returnValue: -1,
        returnString: "failure"
      }
    end
  end

  # DELETE /events/:id
  def destroy
    if @target_event.destroy
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
    def set_event
      @event = Event.find(params[:id])
      authorize @event
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.permit(:name, :startTime, :endTime, :street1, :street2, :city, :zip, :description, :attendenceVisible, :friendsAttendingVisible, :attendenceCap, :coverCharge, :isOpenInvite, :venueLatitude, :venueLongitude,:state)
    end
end
