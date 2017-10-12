class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]
  include Pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?

   # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def new
    @user = current_user
    @profile = Profile.new
    authorize @profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    authorize @profile
    if @profile.save
      redirect_to profile_path(@profile)
    else
     render :new
    end
  end

  def edit
    @profile_characteristics = @profile_characteristics
    authorize @profile
  end

  def update
    authorize @profile
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def show
    @profile = Profile.find(params[:id])
    fail
    @characteristics = @profile.characteristics
    @review = Review.new
    @reviews_for = Review.reviews_for(@profile.user) || 0
    authorize @profile
  end

  private

  def set_profile
    @profile = current_user.profile || current_user.build_profile
  end

  def profile_params
    params.require(:profile).permit(
      :username,
      :first_name,
      :age, :gender,
      :last_name,
      :profile_type,
      :short_description,
      :detailed_description,
      :city_from,
      :country_from,
      :phone_number,
      :photo,
      characteristic_ids: [])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
