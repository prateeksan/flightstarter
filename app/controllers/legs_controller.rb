# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class LegsController < ApplicationController
  # GET /campaigns/:campaign_id/legs/new
  def new
    @leg = Campaign.find(params[:campaign_id]).legs.new
  end

  # POST /campaigns/:campaign_id/legs
  def create
    if Campaign.find(params[:campaign_id]).user == current_user
      add_leg_and_redirect
    else
      render file: 'public/404', status: 401
    end
  end

  # DELETE /legs/:id
  def destroy
    @leg = Leg.find(params[:id])
    if @leg&.campaign&.user == current_user
      @leg.delete
      redirect_to @leg.campaign
    else
      render file: 'public/404', status: 401
    end
  end

  protected
    def leg_params
      params.require(:leg).permit(:campaign_id, :startpoint, :endpoint)
    end

  private
    def add_leg_and_redirect
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
end
