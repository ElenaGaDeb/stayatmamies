class AddProfileTypeToProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :type, :string
    add_column :profiles, :profile_type, :string
  end
end
