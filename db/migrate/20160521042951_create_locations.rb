# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :title
      t.string :latitude
      t.string :longitude
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
