# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class CampaignsController < ApplicationController
  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # POST /campaigns
  def create
    @campaign = Campaign.create(campaign_params)
    if @campaign.save
      flash[:success] = 'Campaign was successfully created.'
    else
      flash[:error] = 'There was an error creating the campaign.'
    end
    redirect_to campaigns_path
  end

  # GET /campaigns
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/:id
  def show
    @campaign = Campaign.find(params[:id])
  end

  private
    def campaign_params
      params.require(:campaign).permit(:title, :description, :requisite_funding)
    end
end
