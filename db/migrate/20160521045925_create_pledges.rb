# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :user, index: true, foreign_key: true
      t.references :campaign, index: true, foreign_key: true
      t.float :amount
      t.string :condition
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
