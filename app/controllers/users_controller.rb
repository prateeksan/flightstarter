# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class UsersController < ApplicationController

  def show
    @current_user = current_user
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, 
        :email, :password, :password_confirmation)
    end

end

