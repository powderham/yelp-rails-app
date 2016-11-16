class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    if current_user.nil?
      redirect_to '/yelp/index'
    else
      @restaurant = Restaurant.new(restaurant_params)
      @restaurant.user_id = current_user.id
      @restaurant.save
      redirect_to '/restaurants'
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
