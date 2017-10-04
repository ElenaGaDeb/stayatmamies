class CreateApartmentAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :apartment_amenities do |t|
      t.references :amenity, foreign_key: true
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
