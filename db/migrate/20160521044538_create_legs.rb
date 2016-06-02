# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class CreateLegs < ActiveRecord::Migration
  def change
    create_table :legs do |t|
      t.string :title
      t.string :type
      t.date :start_date
      t.date :max_start_date
      t.date :min_start_date
      t.date :end_date
      t.date :max_end_date
      t.date :min_end_date
      t.references :campaign, index: true, foreign_key: true
      t.integer :startpoint_id
      t.integer :endpoint_id

      t.timestamps null: false
    end
  end
end
