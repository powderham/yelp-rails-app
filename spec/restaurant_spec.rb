require 'rails_helper'

RSpec.feature 'Restaurant' do
  before (:each) do
    @restaurant = Restaurant.create(name: 'Nanknows', description: 'Very very nice')
  end

  scenario 'Can create a restaurant' do
    sign_up_user_1
    click_button("Create new restaurant")
    fill_in "restaurant_name", with: "Ab"
    fill_in "restaurant_description", with: "Some food"
    find("input[name='commit']").click
    expect(page).to have_content "Belongs to john@email.com"
  end

  scenario 'Can edit a restaurant' do
    sign_up_user_1
    create_restaurant
    find("a[id='edit_restaurant_button']").click
    fill_in "text_area", with: "Sugary sweet, what a lovely treat"
    find("input[name='commit']").click
    expect(page).to have_content "Sugary sweet, what a lovely treat"
  end

  scenario 'Only owner can edit restaurant' do
    sign_out
    sign_up_user_2
    find("a[id='Frankie\'s Fast Food Fiasco']").click
    find("a[id='edit_restaurant_button']").click
    expect(page).to have_current_path "/restaurants/1"
  end
end



# if @restaurant.update_attributes(restaurant_params)
# else
#     render 'edit'
# end
# redirect_to restaurant_path

# if authenticate_restaurant_owner(@restaurant)
#   render 'edit'
#  else
#    redirect_to "/restaurants/#{@restaurant.id}"
# end
# redirect_to restaurant_path
