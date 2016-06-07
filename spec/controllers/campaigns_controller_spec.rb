# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

require 'rails_helper'
require 'shared_examples_for_ownership'

RSpec.describe CampaignsController, type: :controller do
  describe 'POST /campaigns' do
    def attempt_access
      post :create, campaign: attributes_for(:campaign)
    end
    include_examples 'login-required object'
  end
end
