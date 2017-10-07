class AddCoordinatesToApartments < ActiveRecord::Migration[5.1]
  def change
    add_column :apartments, :latitude, :float
    add_column :apartments, :longitude, :float
  end
end
