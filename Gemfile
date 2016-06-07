# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

source 'https://rubygems.org'
ruby '2.3.1'

# {{{ Generic infrastructure
gem 'rails', '4.2.6'
gem 'pg'
gem 'bcrypt', '~> 3.1.7'
gem 'turbolinks'
gem 'puma'
gem 'rack-timeout'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem "twitter-bootstrap-rails", '3.2.2'
gem "font-awesome-rails", '4.6.3.0'
gem 'lograge'
gem 'rails_12factor', group: :production
# }}}

# {{{ Building APIs
#gem 'jbuilder', '~> 2.0'
#gem 'sdoc', '~> 0.4.0', group: :doc
# }}}

# {{{ App-specific dependencies
gem 'geocoder'
gem 'omniauth-stripe-connect'
# }}}

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '3.4.0'
  gem 'quiet_assets'
end

group :test do
  gem 'capybara', '2.7.0'
  gem 'factory_girl_rails'
  gem 'rack_session_access'
  gem 'poltergeist'
  gem 'phantomjs'
  gem 'database_cleaner'
  gem 'webmock', require: false
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
