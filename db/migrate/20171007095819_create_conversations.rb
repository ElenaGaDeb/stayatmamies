class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :sender, references: :users
      t.references :recipient, references: :users

      t.timestamps
    end
    add_foreign_key :conversations, :conversations, column: :sender_id
    add_foreign_key :conversations, :conversations, column: :recipient_id
  end
end
