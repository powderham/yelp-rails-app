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
  end

  scenario 'contain new restaurant button' do
    visit 'yelp/index'
    find('button[name="new_restaurant"]').click
    expect(page).to have_current_path('/restaurant/new')
  end

  scenario 'user can sign up or log in' do
    visit 'yelp/index'
    find('link_to["Sign up"]').click
    fill_in "user_email", with: 'john@email.com'
    fill_in "user_password", with: 'password123'
    fill_in "user_password_confirmation", with: 'password123'
    find('input[name="commit"]').click
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_current_path('/')
  end
end
