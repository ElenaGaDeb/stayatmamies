ActiveAdmin.register Review do
  permit_params :rating,
    :content,
    :for_user_id,
    :by_user_id
end
