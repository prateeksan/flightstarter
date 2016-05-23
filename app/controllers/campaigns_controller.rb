class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.create(campaign_params)
    if @campaign.save
      flash[:success] = 'Campaign was successfully created.'
    else
      flash[:error] = 'There was an error creating the campaign.'
    end
    redirect_to campaigns_path
  end

  def index
    @campaigns = Campaign.all
  end

  private
    def campaign_params
      params.require(:campaign).permit(:title, :description, :requisite_funding)
    end
end
