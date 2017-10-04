class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_characteristics
end
