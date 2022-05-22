class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /events
  def index
    @events = Event.all
    render json: EventBlueprint.render(@events, view: :normal)
  end

  # GET /host_events/:id
  def host_events
    @events = Event.forHost(params[:id]).alphabetical
    render json: EventBlueprint.render(@events, view: :normal)
  end

  # Got rid of??
  # def guest_events
  #   @events = Event.forGuest(params[:id]).alphabetical
  #   options = {}
  #   render json: EventSerializer.new(@events,options)
  # end

  # GET /events/1
  def show
    render json: EventBlueprint.render(@event, view: :show)
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      # render json: {
      #   "returnValue" : 0
      #   "returnString" : "success"
      # }
      render json: EventBlueprint.render(@event, view: :show)
    else
      render json: {
        returnValue: -1,
        returnString: "failure"
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
      params.require(:event).permit(:name, :startTime, :endTime, :street1, :street2, :city, :zip, :description, :attendenceVisible, :friendsAttendingVisible, :attendenceCap, :coverCharge, :isOpenInvite, :venueLatitude, :venueLongitude)
    end
end
