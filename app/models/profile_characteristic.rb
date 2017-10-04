class ProfileCharacteristic < ApplicationRecord
  belongs_to :profile
  has_many :characteristics
end
