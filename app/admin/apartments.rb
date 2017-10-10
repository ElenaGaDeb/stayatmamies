ActiveAdmin.register Apartment do
  permit_params :name,
    :description,
    :deal,
    :street,
    :city,
    :zip_code,
    :country,
    :bedrooms,
    :bathrooms,
    :street2,
    :latitude,
    :longitude,
    :user_id
end
