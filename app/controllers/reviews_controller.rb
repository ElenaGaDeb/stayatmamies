class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @review.by_user_id = current_user.id
    @review.for_user_id = @user.id
    if @review.save
      redirect_to profile_path(@user.profile)
    else
     render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

# profile.user.reviews
