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
    expect(page).to have_current_path('/restaurants/new?new_restaurant=Create+new+restaurant')
  end

  scenario 'user can sign up only once' do
    sign_up_user_1
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_current_path('/')
    find("a:contains('Sign out')").click
    sign_up_user_1
    expect(page).to have_content('Email has already been taken')
    expect(page).to have_current_path('/users')
  end

  scenario 'user can log in' do
    sign_up_user_1
    find("a:contains('Sign out')").click
    log_in_user_1
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_current_path('/')
  end

end
