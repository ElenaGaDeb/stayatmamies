class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end
end
