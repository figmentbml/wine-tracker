require 'rails_helper'

feature "Register" do

  scenario "Create/Register User" do
    visit root_path
    click_on "Sign Up"
    fill_in "Name", with: "James"
    fill_in "Email", with: "jim@email.com"
    fill_in "Password", with: "123"
    fill_in "Password Confirm", with: "123"
    click_button "Sign Up"
    expect(page).to have_no_content("Sign Up")
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("James")
  end

  scenario "Attempt to register user with invalid data" do
    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: "jim@email.com"
    fill_in "Password", with: "123"
    fill_in "Password Confirm", with: "123"
    click_button "Sign Up"
    expect(page).to have_no_content("Sign Out")
    expect(page).to have_content("Name can't be blank")

    visit root_path
    click_on "Sign Up"
    fill_in "Name", with: "James"
    fill_in "Password", with: "123"
    fill_in "Password Confirm", with: "123"
    click_button "Sign Up"
    expect(page).to have_no_content("Sign Out")
    expect(page).to have_content("Email can't be blank")

    visit root_path
    click_on "Sign Up"
    fill_in "Name", with: "James"
    fill_in "Email", with: "jim@email.com"
    fill_in "Password Confirm", with: "123"
    click_button "Sign Up"
    expect(page).to have_no_content("Sign Out")
    expect(page).to have_content("Password can't be blank")

    visit root_path
    click_on "Sign Up"
    fill_in "Name", with: "James"
    fill_in "Email", with: "jim@email.com"
    fill_in "Password", with: "123"
    click_button "Sign Up"
    expect(page).to have_no_content("Sign Out")
    expect(page).to have_content("Password confirmation doesn't match Password")

    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: "jim@email.com"
    fill_in "Password", with: "123"
    fill_in "Password Confirm", with: "456"
    click_button "Sign Up"
    expect(page).to have_no_content("Sign Out")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end


end
