class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
  end

  def create
    flash[:success] = 'Campaign was successfully created.'
    redirect_to campaigns_path
  end

  def index
    @campaigns = Campaign.all
  end
end
