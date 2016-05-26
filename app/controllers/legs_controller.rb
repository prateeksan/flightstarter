class LegsController < ApplicationController
  # GET /campaigns/:campaign_id/legs/new
  def new
    @leg = Campaign.find(params[:campaign_id]).legs.new
  end

  # POST /campaigns/:campaign_id/legs
  def create
    startpoint = City.find_or_create_by name: leg_params[:startpoint]
    endpoint = City.find_or_create_by name: leg_params[:endpoint]
    leg = Leg.new(startpoint: startpoint, endpoint: endpoint,
                  campaign_id: params[:campaign_id])
    if startpoint.valid? and endpoint.valid? and leg.save
      flash[:success] = 'Leg was successfully added.'
    else
      flash[:error] = 'There was an error creating the leg.'
    end
    redirect_to campaign_path(params[:campaign_id])
  end

  protected
    def leg_params
      params.require(:leg).permit(:campaign_id, :startpoint, :endpoint)
    end
end
