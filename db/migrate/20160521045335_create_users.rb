class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.integer :age
      t.string :pronoun
      t.integer :zip
      t.references :city, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.string :street_address
      t.string :avatar
      t.string :bio

      t.timestamps null: false
    end
  end
end
