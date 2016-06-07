# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

require 'rails_helper'

RSpec.feature "User adds a leg to their campaign", type: :feature do
  let(:user) { create(:user) }
  let(:campaign) { create(:campaign, user: user) }
  let!(:city1) { create(:city) }
  let!(:city2) { create(:city) }

  background do
    login_as user
  end

  scenario 'with start/end points' do
    visit "/campaigns/#{campaign.id}"
    # TODO(someday): make this a button
    click_link 'Add leg'
    fill_in 'Startpoint', with: city1.name
    fill_in 'Endpoint', with: city2.name
    click_button 'Create Leg'
    expect(page).to have_text('Leg was successfully added.')
    expect(page).to have_text("#{city1.name} → #{city2.name}")
  end

  scenario 'invalid data' do
    visit "/campaigns/#{campaign.id}"
    click_link 'Add leg'
    click_button 'Create Leg'
    expect(page).to have_text('There was an error creating the leg.')
  end
end
