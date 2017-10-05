class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
  end

  def update
    @profile = Profile.find(params[:profile_id])
    @profile.update(profile_params)
  end

  def show
    @profile = Profile.find(params[:profile_id])
  end

  private
  def profile_params
    params.require(:profile).permit(:username, :type, :first_name, :last_name)
  end
end
