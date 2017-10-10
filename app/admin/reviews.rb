ActiveAdmin.register Review do
  permit_params :rating,
    :content
end
