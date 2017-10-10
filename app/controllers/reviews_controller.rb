class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @review = Review.new(review_params)
    @profile = Profile.find(params[:profile_id])
    @review.by_user_id = current_user.id
    @review.for_user_id = @profile.user.id
    if @review.save
      respond_to do |format|
        format.html { redirect_to profile_path(@profile) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to profile_path(@profile) }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
