class ApartmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  include Pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?

   # Uncomment when you *really understand* Pundit!
   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
   def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def index
    @apartments = policy_scope(Apartment).order(created_at: :desc)
    .where.not(latitude: nil, longitude: nil)

    if params['date-from'] != '' && params['date-from'] != nil && params['date-to'] != '' && params['date-to'] != nil
      @apartments = @apartments.select do |apartment|
        apartment.bookings.first == nil
        if apartment.bookings.first != nil
          next if (apartment.bookings.first.start_date .. apartment.bookings.first.end_date).cover?(Date.parse(params['date-from']))
          next if (apartment.bookings.first.start_date .. apartment.bookings.first.end_date).cover?(Date.parse(params['date-to']))
          (apartment.bookings.first.start_date .. apartment.bookings.first.end_date).cover?(Date.parse(params['date-from'])) == false
          (apartment.bookings.first.start_date .. apartment.bookings.first.end_date).cover?(Date.parse(params['date-to'])) == false
        end
        next(true)
      end
    end

    if params['city'] != '' && params['city'] != nil
      @apartments = @apartments.select  {|apartment| apartment.city.downcase == params['city'].downcase }
    end

    @hash = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      html = ""
      #html += "<img src='<%= cl_image_path apartment.photos[0].path'>"
      html += "#{apartment.name} --> "
      html += "<a href='#{apartment_path(apartment)}'>Go to this apartment</a>"
      marker.lat apartment.latitude
      marker.lng apartment.longitude
      marker.infowindow html
    end
  end

  def show
    @amenities = @apartment.amenities.group_by { |a| a.item_slug }
    @review = Review.new
    @user = @apartment.user
    @apartment_coordinates = { lat: @apartment.latitude, lng: @apartment.longitude }
    authorize @apartment
  end

  def new
    @apartment = Apartment.new
    authorize @apartment
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user
    if @apartment.save
      authorize @apartment
      redirect_to apartment_path(@apartment)
    else
      render :new
    end
  end

  def edit
    @apartment_amenities = @apartment.amenities
    authorize @apartment
  end

  def update
    authorize @apartment
    if @apartment.update!(apartment_params)
      redirect_to apartment_path(@apartment)
    else
      render :update
    end
  end


  def destroy
    @apartment = set_apartment
    authorize @apartment
    @apartment.destroy
    redirect_to(root_path)
  end

  private

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.require(:apartment).permit(
      :user,
      :name,
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
      photos: [],
      amenity_ids: [])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
