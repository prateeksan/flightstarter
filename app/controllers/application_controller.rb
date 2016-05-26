# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  protected
    def current_user
      @x_current_user ||= User.find_by(id: session[:user_id])
    end
end
