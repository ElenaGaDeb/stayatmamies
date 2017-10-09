class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @review = Review.new(review_params)
    @profile = Profile.find(params[:profile_id])
    @review.by_user_id = current_user.id
    @review.for_user_id = @profile.user.id
    if @review.save
      redirect_to profile_path(@profile)
    else
      redirect_to profile_path(@profile), notice: 'review must contain 50 char and rating in 0-5'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
