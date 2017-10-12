class ProfileCharacteristic < ApplicationRecord
  belongs_to :profile
  belongs_to :characteristic
end
