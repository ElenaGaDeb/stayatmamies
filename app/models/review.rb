class Review < ApplicationRecord
  belongs_to :for_user, foreign_key: :for_user_id, class_name: 'User'
  belongs_to :by_user, foreign_key: :by_user_id, class_name: 'User'

  scope :reviews_for, ->(user) { where("for_user_id= ?", user.id) }
  scope :reviews_by, ->(user) { where("by_user_id= ?", user.id) }
end
