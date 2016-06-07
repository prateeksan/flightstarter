# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

require 'rails_helper'

RSpec.describe LegsController, type: :controller do
  let(:us) { create(:user) }
  let(:them) { create(:user) }
  let(:campaign) { create(:campaign, user: us) }
  let(:city) { create(:city) }

  describe 'POST :create' do
    def attempt_access
      post(:create, { campaign_id: campaign.id, leg: { startpoint: city, endpoint: city } },
           { user_id: @current_user&.id })
    end
    def successful_ownership_access
      expect(response).to redirect_to campaign_path(campaign)
    end
    include_examples 'ownership-required object'
  end

  describe 'DELETE :destroy' do
    let!(:leg) { create(:leg, campaign: campaign) }

    def attempt_access
      delete(:destroy, { id: leg.id },
           { user_id: @current_user&.id })
    end
    def successful_ownership_access
      expect(response).to redirect_to campaign_path(campaign)
    end
    include_examples 'ownership-required object'
  end

  def logout
    @current_user = nil
  end

  def login_as_us
    @current_user = us
  end

  def login_as_them
    @current_user = them
  end
end
