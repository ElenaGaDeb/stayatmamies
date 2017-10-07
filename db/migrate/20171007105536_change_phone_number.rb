class ChangePhoneNumber < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :phone_number, :string
    add_column :profiles, :country_from, :string

  end
end
