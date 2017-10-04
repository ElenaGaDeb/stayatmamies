class Amenity < ApplicationRecord
  has_many :apartment_amenities
  has_many :apartments, through: :apartment_amenities
end
