require 'rails_helper'

RSpec.feature 'Reviews' , :type => :feature do

  scenario 'Can leave a review', focus: true do
    sign_up_user_1
    create_restaurant
    visit '/yelp/index'
    find('a[id="review_Frankie\'s Fast Food Fiasco"]').click
    # find('Id or class here').set('some text')
    find('select[id="review_rating"]').set(1)
    find('textarea[id="review_comment"]').set("Found a hair in my food. Disgusting.")
    find('input[name="commit"]').click
    visit '/yelp/index'
    find('a[id="Frankie\'s Fast Food Fiasco"]').click
    puts page.body
    expect(page).to have_content "Review by john@email.com"
  end

end
