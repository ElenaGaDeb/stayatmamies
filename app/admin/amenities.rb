ActiveAdmin.register Amenity do
  permit_params :category,
    :name,
    :item_slug
end
