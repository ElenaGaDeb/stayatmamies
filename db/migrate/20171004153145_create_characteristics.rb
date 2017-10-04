class CreateCharacteristics < ActiveRecord::Migration[5.1]
  def change
    create_table :characteristics do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
