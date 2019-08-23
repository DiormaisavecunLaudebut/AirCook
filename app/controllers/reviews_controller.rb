class ReviewsController < ApplicationController
  skip_after_action :verify_authorized, only: [:create, :new]
  def new
    @kitchen = Kitchen.find(params[:kitchen_id])
    @review = Review.new
  end

  def create
    @kitchen = Kitchen.find(params[:kitchen_id])
    @review = Review.new(review_params)
    @review.kitchen = @kitchen
    @review.user = current_user
    if @review.save
      redirect_to kitchens_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
