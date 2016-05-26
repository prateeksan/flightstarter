class AxeLocations < ActiveRecord::Migration
  def change
    drop_table :locations
    remove_column :residences, :location_id
    remove_column :stations, :location_id
    remove_column :users, :location_id
    add_column :residences, :city_id, :integer, index: true
    add_column :stations, :city_id, :integer, index: true
  end
end
