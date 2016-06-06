require 'rack_session_access/capybara'

module FeatureHelpers
  def login_as(user)
    page.set_rack_session(user_id: user.id)
  end

  def logout
    page.set_rack_session(user_id: nil)
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
