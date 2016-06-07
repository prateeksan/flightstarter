class StripeAuthController < ApplicationController
  # GET /auth/stripe_connect/callback
  def callback
    current_user.add_stripe_connect(request.env['omniauth.auth'])
    current_user.save!
    flash[:success] = 'Stripe connect succeeded.'
    redirect_to '/'
  end

  # GET /auth/failure
  def failure
    flash[:error] = 'Stripe connect failed.'
    redirect_to '/'
  end
end
