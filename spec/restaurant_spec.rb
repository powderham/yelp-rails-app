require 'rails_helper'

describe Restaurant do

  before (:each) do
    @restaurant = Restaurant.create(name: 'Nanknows', description: 'Very very nice')
  end

  scenario 'Can create a restaurant' do
    sign_up_user_1
    visit 'yelp/index'
    click_button("Create new restaurant")
    fill_in "restaurant_name", with: "Ab"
    fill_in "restaurant_description", with: "Some food"
    find("input[name='commit']").click
    visit 'yelp/index'
    find('a[id="Ab"]').click
    expect(page).to have_content "Belongs to john@email.com"
  end
end
