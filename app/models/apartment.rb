class Apartment < ApplicationRecord
  has_many :apartment_amenities
  belongs_to :user
  has_many :bookings
  has_many :amenities, through: :apartment_amenities
end
