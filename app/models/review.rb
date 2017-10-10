class Review < ApplicationRecord
  belongs_to :for_user, foreign_key: :for_user_id, class_name: 'User'
  belongs_to :by_user, foreign_key: :by_user_id, class_name: 'User'

  scope :reviews_for, ->(user) { where("for_user_id= ?", user.id) }
  scope :reviews_by, ->(user) { where("by_user_id= ?", user.id) }

  validates :content, presence: true, length: { minimum: 25 }
  validates :rating, presence: true, inclusion: { in: (0..5), allow_nil: false }
end
