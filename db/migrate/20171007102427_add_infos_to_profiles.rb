class AddInfosToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :phone_number, :integer
    add_column :profiles, :country_from, :string
  end
end
