class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_apartment, only: [:new, :create, :update]

  #include Pundit
  #after_action :verify_authorized, except: :index, unless: :skip_pundit?
  #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
   def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end


  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.apartment = @apartment
    @booking.status = 'pending'
    if @booking.save
      redirect_to apartment_path(@apartment), notice: "you successfully sent a request for this apartment"
    else
     render :new
    end
  end

  def update
    @profile = current_user.profile
    @booking = Booking.find(params[:id])
    @booking.status = params[:booking][:status]
    @booking.save
    redirect_to profile_path(@profile)
  end


  def show
    @booking = Booking.find(params[:id])
    @user = current_user
    @apartment = @booking.apartment
    @host = @apartment.user
  end

  private

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def booking_params
     params.require(:booking).permit(:user, :apartment, :status, :start_date, :end_date)
  end

end
