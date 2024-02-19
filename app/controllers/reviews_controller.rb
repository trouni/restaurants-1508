class ReviewsController < ApplicationController

  # '/restaurants/:restaurant_id/reviews/new'
  def new
    # this is just for the form
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # form will send here => '/restaurants/:restaurant_id/reviews'
  def create
    # load the restaurant from the url
    @restaurant = Restaurant.find(params[:restaurant_id])
    # create the review from the form information
    @review = Review.new(review_params)
    # we attach the restaurant from the URL to the new instance
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
