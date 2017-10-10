class AddRefToConversations < ActiveRecord::Migration[5.1]
  def change
    add_reference(:conversations, :apartment, foreign_key: true)
  end
end
