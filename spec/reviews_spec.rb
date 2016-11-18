require 'rails_helper'

RSpec.feature 'Reviews' , :type => :feature do
  before (:each) do
    @restaurant = Restaurant.create(name: 'Nanknows', description: 'Very very nice')
  end

  scenario 'you can submit a review', focus: true do
    sign_up_user_1
    visit 'yelp/index'
    click_button("Create new restaurant")
    fill_in "restaurant_name", with: "Ab"
    fill_in "restaurant_description", with: "Some food"
    find("input[name='commit']").click
    expect(page).to have_content "Belongs to john@email.com"
  end

  scenario 'users can delete their own reviews' do
    sign_up_user_1
    create_restaurant
    find("a:contains('Sign out')").click
    sign_up_user_2
    find('a[id="review_Frankie\'s Fast Food Fiasco"]').click
    find("input[id$='review_rating']").set "3"
    fill_in "review_comment", with: "Anything...:)"
    click_button "Leave Review"
    

  end



end
