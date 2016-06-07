# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class User < ActiveRecord::Base
  has_secure_password
  belongs_to :city
  belongs_to :location

  validate :stripe_presence_consistency

  def has_stripe_connect?
    !!(stripe_uid && stripe_pk && stripe_token)
  end

  def add_stripe_connect(auth)
    assign_attributes(
      stripe_uid: auth.uid,
      stripe_pk: auth.info&.stripe_publishable_key,
      stripe_token: auth.credentials&.token)
  end

  private
    def stripe_presence_consistency
      unless stripe_uid.nil? == stripe_pk.nil? &&
             stripe_pk.nil? == stripe_token.nil?
        errors.add(:base, 'Partial Stripe Connect data.')
      end
    end
end
