class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  belongs_to :for_user, foreign_key: :for_user_id, class_name: 'User'
  belongs_to :by_user, foreign_key: :by_user_id, class_name: 'User'

  scope :messages_for, ->(user) { where("for_user_id= ?", user.id) }
  scope :messages_by, ->(user) { where("by_user_id= ?", user.id) }


  validates :content, presence: true
end
