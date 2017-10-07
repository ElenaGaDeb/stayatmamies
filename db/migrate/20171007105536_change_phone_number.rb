class ChangePhoneNumber < ActiveRecord::Migration[5.1]
  def change
    change_column :profiles, :phone_number, :string
  end
end
