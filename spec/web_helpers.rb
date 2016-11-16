def sign_up_user_1
  visit 'yelp/index'
  find("a:contains('Sign up')").click
  fill_in "user_email", with: 'john@email.com'
  fill_in "user_password", with: 'password123'
  fill_in "user_password_confirmation", with: 'password123'
  find('input[name="commit"]').click
end

def log_in_user_1
  visit 'yelp/index'
  find("a:contains('Sign in')").click
  fill_in "user_email", with: 'john@email.com'
  fill_in "user_password", with: 'password123'
  find('input[name="commit"]').click
end

def create_restaurant
  visit 'yelp/index'
  click_button("Create new restaurant")
  fill_in "restaurant_name", with: "Frankie's Fast Food Fiasco"
  fill_in "restaurant_description", with: "Bad food, worse service"
  find("input[name='commit']").click
  visit 'yelp/index'
  find('a[id="Frankie\'s Fast Food Fiasco"]').click
end
