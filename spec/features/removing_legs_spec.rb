# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

require 'rails_helper'

RSpec.feature "User removes a leg from a campaign", type: :feature do
  let(:campaign) { create(:campaign) }
  let!(:leg) { create(:leg, campaign: campaign) }

  scenario 'clicking x in campaign page' do
    visit "/campaigns/#{campaign.id}"
    expect do
      click_link('Delete leg')
    end.to change(Leg, :count).by(-1)
    expect(page).to have_current_path("/campaigns/#{campaign.id}")
  end
end
