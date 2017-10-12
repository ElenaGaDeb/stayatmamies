class Characteristic < ApplicationRecord
  has_many :profile_characteristics
  has_many :profiles, through: :profile_characteristics
end
