require 'rails_helper'

RSpec.feature "Creating campaigns", type: :feature do
  scenario 'User creates a campaign' do
    visit '/campaigns/new'

    fill_in 'Title', with: 'Cool Campaign'
    click_button 'Create Campaign'

    expect(page).to have_text('Campaign was successfully created.')
  end
end
