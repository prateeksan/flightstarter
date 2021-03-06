# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

require 'rails_helper'

RSpec.describe LandingController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
