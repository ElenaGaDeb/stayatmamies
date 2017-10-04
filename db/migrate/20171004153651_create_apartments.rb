class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :description
      t.string :deal
      t.string :street
      t.string :city
      t.integer :zip_code
      t.string :country
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :street2

      t.timestamps
    end
  end
end
