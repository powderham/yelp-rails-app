class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurant.reviews
  end

  def create
    if current_user.nil?
      redirect_to '/yelp/index'
    else
      @restaurant = Restaurant.new(restaurant_params)
      @restaurant.user_id = current_user.id
      @restaurant.save
      redirect_to "/restaurants/#{@restaurant.id}"
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    flash[:succes] = "Restaurant deleted"
    redirect_to restaurants_path
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if authenticate_restaurant_owner(@restaurant)
        @restaurant.update_attributes(restaurant_params)
        redirect_to restaurant_path
      else
        redirect_to "/restaurants/#{@restaurant.id}"
    end

  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

  def authenticate_restaurant_owner(restaurant_object)
    current_user.id == restaurant_object.user_id
  end

end
