# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class AddOAuthDetails < ActiveRecord::Migration
  def change
    add_column :users, :stripe_uid, :string
    add_column :users, :stripe_pk, :string
    add_column :users, :stripe_token, :string
  end
end
