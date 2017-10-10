ActiveAdmin.register Profile do
  permit_params :username,
    :first_name,
    :last_name,
    :age,
    :city_from,
    :gender,
    :detailed_description,
    :short_description,
    :profile_type,
    :phone_number,
    :country_from,
    :user_id
end
