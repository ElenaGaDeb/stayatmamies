class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @review.by_user_id = current_user.id
    @review.for_user_id = @user.id
    if @review.save
      redirect_to profile_path(@user.profile)
    else
      render 'profiles/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

# profile.user.reviews
