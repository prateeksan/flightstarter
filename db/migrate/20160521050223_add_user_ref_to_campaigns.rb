# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class AddUserRefToCampaigns < ActiveRecord::Migration
  def change
    add_reference :campaigns, :user, index: true, foreign_key: true
  end
end
