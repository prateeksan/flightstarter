require 'rails_helper'

RSpec.feature "User views campaigns", type: :feature do
  scenario 'no campaigns' do
    visit '/campaigns'
    expect(page).to have_text('There are no campaigns. Why not create one?')
    click_link 'Why not create one?'
    expect(page).to have_current_path('/campaigns/new')
  end

  scenario 'a campaign' do
    create(:campaign, title: 'Awesome Campaign', description: 'A description',
           requisite_funding: 123.45)
    visit '/campaigns'
    expect(page).to have_content('Awesome Campaign')
    expect(page).to have_content('A description')
    expect(page).to have_content('123.45')
  end

  scenario 'three campaigns' do
    3.times {|i| create(:campaign, title: "Campaign #{i}") }
    visit '/campaigns'
    expect(page).to have_content('Campaign 0')
    expect(page).to have_content('Campaign 1')
    expect(page).to have_content('Campaign 2')
  end
end
