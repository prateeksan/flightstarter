# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

require 'rails_helper'

RSpec.feature "User creates a campaign", type: :feature do
  background do
    login_as create :user
  end

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
end
