class ApartmentAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :apartment
end
