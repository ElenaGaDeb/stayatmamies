class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Cocktail.new(cocktail_params)
    if @apartment.save!
      redirect_to apartment_path(@apartment)
    else
      render :new
    end
  end

  private
  def apartment_params
    params.require(:apartment).permit()
  end
end
