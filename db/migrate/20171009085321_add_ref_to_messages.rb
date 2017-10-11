class AddRefToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference(:messages, :for_user, foreign_key: {to_table: :users})
    add_reference(:messages, :by_user, foreign_key: {to_table: :users})
  end
end
