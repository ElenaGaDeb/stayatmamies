class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @profile = Profile.find(params[:profile_id])
    @review.by_user_id = current_user.id
    @review.for_user_id = @profile.id
    @review.save
    # if params[:profile_id]
    #   redirect_to profile_path(@profile)
    # # ajouter form du côté student (profile#show)
    # elsif params[:apartment_id]
    #   redirect_to apartment_path(@apartment)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
