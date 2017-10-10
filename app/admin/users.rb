ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name

  #remove useless columns in admin interface
  index do
    selectable_column
    column :id
    column :email
    column :first_name
    column :last_name
    column :created_at
    column :admin
    actions
  end
end
