class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path(@profile)
    else
     render :new
    end
  end

  def edit

  end

  def update
    if @profile.update(profile_params)
        #redirect_to @profile_path(@profile)
    else
      render :edit
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @review = Review.new
    @reviews_for = Review.reviews_for(@profile)
  end

  private

  def set_profile
    @profile = current_user.profile || current_user.build_profile
  end

  def profile_params
    params.require(:profile).permit(:username, :first_name, :age, :gender, :last_name, :profile_type, :short_description, :detailed_description, :city_from, :country_from, :phone_number, :photo)
  end
end
