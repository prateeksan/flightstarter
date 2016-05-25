class GeocodeFloats < ActiveRecord::Migration
  def change
    change_column :locations, :latitude, :float
    change_column :locations, :longitude, :float
  end
end
