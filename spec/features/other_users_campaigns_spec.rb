# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

require 'rails_helper'

RSpec.feature "User visits another user's campaign", type: :feature do
  let(:us) { create(:user) }
  let(:them) { create(:user) }
  let(:campaign) { create(:campaign, user: them) }

  background do
    login_as us
  end

  scenario "not adding legs" do
    visit "/campaigns/#{campaign.id}"
    expect(page).not_to have_link('Add leg')
  end
end
