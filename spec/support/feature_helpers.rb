require 'rack_session_access/capybara'

module FeatureHelpers
  def login_as(user)
    page.set_rack_session(user_id: user.id)
  end

  def logout
    page.set_rack_session(user_id: nil)
  end

  def mock_stripe_auth!
    OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
      "provider"=>"stripe_connect",
      "uid"=>"acct_18FVVTAV9g6axPpp",
      "info"=>{
        "name"=>"FlightStarter",
        "email"=>"tankeepervest@gmail.com",
        "nickname"=>"FlightStarter",
        "scope"=>"read_write",
        "livemode"=>false,
        "stripe_publishable_key"=>"pk_test_i5gj9ae6UJ6O86MkLK3eZV8M"
      },
      "credentials"=>{
        "token"=>"sk_test_BJxybwvpilkZU678mokfgGBp",
        "expires"=>false,
        "refresh_token"=>"rt_8agzngvi0dWd192xxfbOPzj9Soi4LqfHYdYFMgOmSLGYkvxC"
      },
      "extra"=>{
        "raw_info"=>{
          "livemode"=>false,
          "token_type"=>"bearer",
          "stripe_publishable_key"=>"pk_test_i5gj9ae6UJ6O86MkLK3eZV8M",
          "stripe_user_id"=>"acct_18FVVTAV9g6axPpp",
          "scope"=>"read_write"
        },
        "extra_info"=>{
          "id"=>"acct_18FVVTAV9g6axPpp",
          "object"=>"account",
          "business_logo"=>nil,
          "business_name"=>nil,
          "business_url"=>nil,
          "charges_enabled"=>false,
          "country"=>"US",
          "default_currency"=>"usd",
          "details_submitted"=>false,
          "display_name"=>"FlightStarter",
          "email"=>"tankeepervest@gmail.com",
          "managed"=>false,
          "metadata"=>{},
          "statement_descriptor"=>nil,
          "support_email"=>nil,
          "support_phone"=>nil,
          "timezone"=>"America/New_York",
          "transfers_enabled"=>false
        }
      }
    })
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
