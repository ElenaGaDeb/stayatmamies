class BookingsController < ApplicationController
  before_action :set_apartment, only: [:new, :create]


  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.apartment = @apartment
    @host = @apartment.user
    if @booking.save
      redirect_to apartment_booking_path(@apartment, @booking)
    else
     render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @user = current_user
    @apartment = @booking.apartment
    @host = @apartment.user
  end

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end

  private
  def booking_params
     params.require(:booking).permit(:user, :apartment, :status)
  end

end
