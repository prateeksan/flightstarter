require 'rails_helper'

RSpec.feature "User creates a campaign", type: :feature do
  scenario 'with minimal input' do
    visit '/campaigns/new'
    fill_in 'Title', with: 'Cool Campaign'
    click_button 'Create Campaign'
    expect(page).to have_text('Campaign was successfully created.')
  end

  scenario 'with invalid input' do
    visit '/campaigns/new'
    click_button 'Create Campaign'
    expect(page).to have_text('There was an error creating the campaign.')
  end

  scenario 'with detailed input' do
    visit '/campaigns/new'
    fill_in 'Title', with: 'My Campaign'
    fill_in 'Description', with: 'Some really neat description.'
    fill_in 'Requisite funding', with: '350'
    click_button 'Create Campaign'
    expect(page).to have_text('Campaign was successfully created.')
  end

  # TODO(soon): doesn't allow numeric-only campaigns
  # goal: keep /campaigns/:id and /campaigns/:title disjoint
end
