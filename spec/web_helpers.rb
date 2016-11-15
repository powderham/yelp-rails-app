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
