class LandingController < ApplicationController
  def index
    @current_user = current_user
  end

  # private

  # def current_user
  #   if session[:user_id]
  #     return User.find(session[:user_id])
  #   else
  #     return nil
  #   end
  # end
  
end
