class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.by_user_id = current_user_id
    @profile = Profile.find(params[:profile_id])
    @review.for_user_id = @profile
    @review.save
    redirect_to user_path(@review)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
