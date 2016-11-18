class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    if current_user.nil?
      redirect_to '/yelp/index'
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      @review = @restaurant.build_review review_params, current_user
      if @review.save
        redirect_to @restaurant
      else
        if @review.errors[:user]
          redirect_to @restaurant, alert: 'You have already reviewed this restaurant'
        else
          render :new
        end
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:succes] = "Review deleted"
    redirect_to restaurants_path
  end

  private
  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
