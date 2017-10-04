class CreateProfileCharacteristics < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_characteristics do |t|
      t.references :characteristic, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
