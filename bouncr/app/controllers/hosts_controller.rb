class HostsController < ApplicationController
  before_action :set_host, only: [:show, :update, :destroy]
  before_action :authorized
  wrap_parameters format: [:json]

  # GET /hosts
  def index
    @hosts = olicy_scope(Host)
    render json: HostBlueprint.render(@hosts)
  end

  # GET /hosts/1
  def show
    render json: HostBlueprint.render(@host)
  end

  # POST /hosts
  def create
    @host = Host.new(host_params)

    if @host.save
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

  # PATCH/PUT /hosts/1
  def update
    if @host.update(host_params)
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

  # DELETE /hosts/1
  def destroy
    if @host.destroy
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
    def set_host
      @host = Host.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def host_params
      params.require(:host).permit(:user_id, :event_id)
    end
end
