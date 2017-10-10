ActiveAdmin.register ProfileCharacteristic do
  permit_params :characteristic_id,
  :profile_id,
  :user_id
end
