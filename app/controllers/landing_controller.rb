class LandingController < ApplicationController
  def index
    @current_user = session[:user_id]
  end
end
