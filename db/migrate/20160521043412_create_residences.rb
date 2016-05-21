class CreateResidences < ActiveRecord::Migration
  def change
    create_table :residences do |t|
      t.string :name
      t.string :type
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
