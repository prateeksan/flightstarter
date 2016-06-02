# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class GeocodeFloats < ActiveRecord::Migration
  def change
    remove_column :locations, :latitude
    remove_column :locations, :longitude
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end
