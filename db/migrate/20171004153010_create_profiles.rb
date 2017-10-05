class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :type
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :city_from
      t.string :gender
      t.string :detailed_description
      t.string :short_description
      t.timestamps
    end
  end
end
