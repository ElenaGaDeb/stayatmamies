class Apartment < ApplicationRecord
  has_many :apartment_amenities
  belongs_to :user
  has_many :bookings
end
