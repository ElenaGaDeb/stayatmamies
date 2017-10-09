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
    @hash = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
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
