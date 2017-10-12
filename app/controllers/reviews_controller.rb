class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  include Pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?


   # Uncomment when you *really understand* Pundit!
   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
   def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(profile_path(@profile))
  end


  def create
    @review = Review.new(review_params)
    @profile = Profile.find(params[:profile_id])
    @review.by_user_id = current_user.id
    @review.for_user_id = @profile.user.id
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to profile_path(@profile) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        # format.html { redirect_to profile_path(@profile), notice: 'Review must have more than 25 chars' }
        format.html { render 'profiles/show' }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end


    def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
