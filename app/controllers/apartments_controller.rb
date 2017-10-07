class ApartmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  def index
    @apartments = Apartment.all
  end

  def show
    @amenities = @apartment.amenities.group_by { |a| a.item_slug }
    # need to work on view
  end

  def new
    @apartment = Apartment.new
    @apartment_amenities = ApartmentAmenity.new
  end

  def create
    fail
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user
    if @apartment.save!
      redirect_to apartment_path(@apartment)
    else
      render :new
    end
  end

  def edit
    @apartment_amenities = @apartment.amenities
  end

  def update
    if @apartment.update!(apartment_params)
      redirect_to apartment_path(@apartment)
    else
      render :update
    end
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
      :apartment_ids => [])
  end
end
