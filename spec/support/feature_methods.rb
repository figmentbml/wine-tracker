def signin(user, password)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: password
  click_button "Sign in"
end
