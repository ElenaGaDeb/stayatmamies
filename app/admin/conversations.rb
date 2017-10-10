ActiveAdmin.register Conversation do
  permit_params :sender_id,
    :recipient_id
end
