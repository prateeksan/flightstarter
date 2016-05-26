require 'rails_helper'

RSpec.feature "User adds a leg to a campaign", type: :feature do
  let(:campaign) { create(:campaign) }
  let!(:city1) { create(:city) }
  let!(:city2) { create(:city) }

  # TODO(soon): users can only edit their own campaigns

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
