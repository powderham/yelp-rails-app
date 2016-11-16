require 'rails_helper'

RSpec.feature 'New Restaurant', :type => :feature do
  scenario 'it creates a new restaurant' do
    sign_up_user_1
    visit 'restaurants/new'
    fill_in "restaurant_name", with: "El Bogavante de Oro"
    fill_in "restaurant_description", with: "Come here for amazing rice with lobster"
    click_button 'Save Restaurant'
    expect(page).to have_content "El Bogavante de Oro"
  end
end
