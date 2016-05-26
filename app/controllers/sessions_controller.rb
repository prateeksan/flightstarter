class SessionsController < ApplicationController

  def new
    redirect_to '/auth/stripe'
  end

  def create
    auth = request.env['omniauth.auth']
    user = User.where(
        provider: auth['provider'],
        uid: auth['uid'].to_s).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
