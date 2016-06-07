require 'rails_helper'

RSpec.feature 'User adds Stripe connect', type: :feature do
  let!(:user) { create(:user) }

  background do
    login_as user
  end

  after do
    logout
  end

  scenario 'with valid Stripe login' do
    visit '/'
    mock_stripe_auth!
    expect do
      find("a[href='/auth/stripe_connect']").click
    end.to change { user.reload.has_stripe_connect? }.from(false).to(true)
    expect(page).to have_text 'Stripe connect succeeded.'
    expect(page).not_to have_selector("a[href='/auth/stripe_connect']")
  end

  scenario 'with invalid credentials' do
    visit '/'
    OmniAuth.config.mock_auth[:stripe_connect] = :invalid_credentials
    find("a[href='/auth/stripe_connect']").click
    expect(page).to have_text('Stripe connect failed.')
    expect(page).to have_selector("a[href='/auth/stripe_connect']")
  end

  scenario 'missing token' do
    visit '/'
    mock_stripe_auth!
    OmniAuth.config.add_mock(:stripe_connect, credentials: { token: nil })
    expect do
      find("a[href='/auth/stripe_connect']").click
    end.to raise_error(ActiveRecord::RecordInvalid)
    expect(user.reload).not_to have_stripe_connect
  end
end
