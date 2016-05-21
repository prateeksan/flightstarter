class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :type
      t.string :description
      t.float :requisite_funding
      t.boolean :confirmed

      t.timestamps null: false
    end
  end
end
