class YelpController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
end
