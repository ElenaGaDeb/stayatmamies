class Booking < ApplicationRecord
  belongs_to :apartment
  belongs_to :user
  has_many :messages
end
