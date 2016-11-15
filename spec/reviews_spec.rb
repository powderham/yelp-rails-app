require 'rails_helper'

RSpec.feature 'Reviews' , :type => :feature do
  before (:each) do
    @restaurant = Restaurant.create(name: 'Nanknows', description: 'Very very nice')
  end

  scenario 'you can submit a review' do
    visit 'yelp/index'

  end
end
