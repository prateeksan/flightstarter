# # Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

# /spec/features/user_registration_spec.rb
require 'rails_helper'

RSpec.feature 'Visitor registers' do
  
  scenario 'with valid fields' do
      visit '/'
      click_link "Sign Up"

      fill_in "Username", :with => "testuser"
      fill_in "Password", :with => "password1"
      fill_in "Password confirmation", :with => "password1"
      fill_in "Email", :with => "test@user.com"

      #TODO(soon): Add spec tests for Avatar upload

      click_button "Sign Up"
      expect(page).to have_text("Welcome testuser!")
  end

  scenario 'with invalid fields' do
    pending 'Add extra fields'
      visit '/'
      click_link "Sign Up"

      fill_in "Username", :with => "testuser"
      fill_in "Password", :with => ""
      fill_in "Email", :with => "test@user.com"
      fill_in "Age", :with => "20"
      fill_in "Pronoun", :with => "He"
      fill_in "Zip", :with => "122011"
      fill_in "City", :with => "Delhi"
      fill_in "Street Address", :with => "5 Street West"
      fill_in "Biodata", :with => "All you need to know about me."

      #TODO(soon): Add spec tests for Avatar upload

      click_button "Sign Up"
      expect(page).to have_text("The following errors occured:")
  end

end
