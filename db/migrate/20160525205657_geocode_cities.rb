# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class GeocodeCities < ActiveRecord::Migration
  def change
    add_column :cities, :latitude, :float
    add_column :cities, :longitude, :float
  end
end
