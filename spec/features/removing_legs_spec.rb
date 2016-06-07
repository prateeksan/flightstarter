# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

require 'rails_helper'

RSpec.feature "User removes a leg from a campaign", type: :feature do
  let(:us) { create(:user) }
  let(:them) { create(:user) }
  let(:campaign) { create(:campaign, user: us) }
  let!(:leg) { create(:leg, campaign: campaign) }

  scenario 'clicking x on our own campaign page' do
    login_as us
    visit "/campaigns/#{campaign.id}"
    expect do
      click_link('Delete leg')
    end.to change(Leg, :count).by(-1)
    expect(page).to have_current_path("/campaigns/#{campaign.id}")
  end

  scenario 'not seeing x on their campaign page' do
    login_as them
    visit "/campaigns/#{campaign.id}"
    expect(page).not_to have_link('Delete leg')
  end
end
