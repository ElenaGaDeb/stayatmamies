class Review < ApplicationRecord
  belongs_to :for_user, foreign_key: :for_user_id, class_name: 'User'
  belongs_to :by_user, foreign_key: :by_user_id, class_name: 'User'
end
