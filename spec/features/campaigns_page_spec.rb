require 'rails_helper'

RSpec.feature "User visits a campaign's page", type: :feature do
  let!(:campaign) { create(:campaign, description: "A cool description.") }

  scenario "via /campaigns" do
    visit '/campaigns'
    click_link campaign.title
    expect(page).to have_text(campaign.description)
  end

  scenario "via /campaign/:id" do
    visit "/campaigns/#{campaign.id}"
    expect(page).to have_text(campaign.description)
  end
end
