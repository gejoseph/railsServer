class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  before_action :authorized
  wrap_parameters format: [:json]

  # GET /events
  def index
    @events = Event.all
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
    render json: EventBlueprint.render(@event, view: :show)
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
      #render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/:id
  def update
    if @event.update(event_params)
      render json: EventBlueprint.render(@event, view: :show)
      # render json: @event
    else
      render json: {
        returnValue: -1,
        returnString: "failure"
      }
      # render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/:id
  def destroy
    if @event.destroy
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
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.permit(:name, :startTime, :endTime, :street1, :street2, :city, :zip, :description, :attendenceVisible, :friendsAttendingVisible, :attendenceCap, :coverCharge, :isOpenInvite, :venueLatitude, :venueLongitude,:state)
    end
end
