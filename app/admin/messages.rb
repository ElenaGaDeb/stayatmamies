ActiveAdmin.register Message do
  permit_params :content,
  :user_id,
  :conversation_id
end
