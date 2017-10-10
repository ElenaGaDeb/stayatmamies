ActiveAdmin.register Booking do
  permit_params :start_date,
    :end_date,
    :status
end
