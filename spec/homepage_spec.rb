require 'rails_helper'

RSpec.feature 'Homepage', :type => :feature do
  before (:each) do
    @restaurant = Restaurant.create(name: 'Nanknows', description: 'Very very nice')
    puts @restaurants
    puts "==="
    puts @restaurant
    @restaurant1 = Restaurant.new
    puts "==="
    puts @restaurant1
  end

  scenario 'displays restaurants on the homepage' do
    visit 'yelp/index'
    expect(page).to have_content('Nanknows')
  end
end
