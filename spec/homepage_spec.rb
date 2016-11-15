require 'rails_helper'

RSpec.feature 'Homepage', :type => :feature do
  before (:each) do
    @restaurant = Restaurant.create(name: 'Nanknows', description: 'Very very nice')
    @review1 = Review.create(rating: 4, comment: "Was indeed very very nice")
    @review2 = Review.create(rating: 2, comment: "Was less nice than advertised")
  end

  scenario 'displays restaurants on the homepage' do
    visit 'yelp/index'
    expect(page).to have_content(@restaurant.name)
    expect(page).to have_content(@restaurant.description)
    expect(page).to have_content(3)
  end

  scenario 'contain new restaurant button' do
    visit 'yelp/index'
    click_button 'new_restaurant'
    expect(page).to have_current_path('/restaurant/new')
  end
end
