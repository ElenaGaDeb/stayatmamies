class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @user = current_user
    @apartment = Apartment.find(@apartment.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to profile_path(@booking)
    else
     render :new
    end
  end

  private
  def booking_params
     params.require(:booking).permit(:user, :apartment, :status)
  end

end
