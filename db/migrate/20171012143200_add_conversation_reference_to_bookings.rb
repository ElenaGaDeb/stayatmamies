class AddConversationReferenceToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference(:bookings, :conversation, foreign_key: true)
  end
end
