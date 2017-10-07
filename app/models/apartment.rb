class Apartment < ApplicationRecord
  has_many :apartment_amenities
  belongs_to :user
  has_many :bookings


  geocoded_by :full_address
  after_validation :geocode, if: :street_changed?
  after_validation :geocode, if: :country_changed?
  after_validation :geocode, if: :zip_code_changed?
  after_validation :geocode, if: :city_changed?
  after_validation :geocode, if: :street2_changed?

def full_address
  if street2 != nil
    return "#{street}, #{street2}, #{zip_code} #{city}, #{country}"
  else
    return "#{street}, #{zip_code} #{city}, #{country}"
  end
end
end
