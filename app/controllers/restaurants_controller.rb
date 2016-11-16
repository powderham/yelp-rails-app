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
      redirect_to '/restaurants'
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
      if @restaurant.update_attributes(restaurant_params)
      else
          render 'edit'
      end
      redirect_to restaurant_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
