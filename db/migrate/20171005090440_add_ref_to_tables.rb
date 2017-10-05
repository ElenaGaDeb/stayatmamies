class AddRefToTables < ActiveRecord::Migration[5.1]
  def change
    add_reference(:reviews, :for_user, foreign_key: {to_table: :users})
    add_reference(:reviews, :by_user, foreign_key: {to_table: :users})

    add_reference :profile_characteristics, :user, foreign_key: true
    add_reference :apartments, :user, foreign_key: true
  end
end
