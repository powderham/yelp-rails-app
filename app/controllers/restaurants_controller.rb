class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @user = current_user
    @restaurant.user_id = @user.id
    @restaurant.save
    redirect_to '/restaurants'
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
