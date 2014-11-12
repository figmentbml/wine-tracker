require 'rails_helper'

feature "Sign In" do

  scenario "User signs in" do
    User.create!(
    name: "James",
    email: "jim@email.com",
    password: "123",
    password_confirmation: "123"
    )

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "jim@email.com"
    fill_in "Password", with: "123"
    click_button "Sign In"
    expect(page).to have_no_content("Sign In")
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("James")
  end

  scenario "User tries to sign in w/o invalid data" do
    User.create!(
    name: "James",
    email: "jim@email.com",
    password: "123",
    password_confirmation: "123"
    )

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "jim@email.com"
    fill_in "Password", with: "456"
    click_button "Sign In"
    expect(page).to have_content("Email / Password combination is invalid")
    expect(page).to have_content("Sign In")
    expect(page).to have_no_content("James")

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "james@email.com"
    fill_in "Password", with: "123"
    click_button "Sign In"
    expect(page).to have_content("Email / Password combination is invalid")
    expect(page).to have_content("Sign In")
    expect(page).to have_no_content("James")
  end

  scenario "User signs out" do
    User.create!(
    name: "James",
    email: "jim@email.com",
    password: "123",
    password_confirmation: "123"
    )

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "jim@email.com"
    fill_in "Password", with: "123"
    click_button "Sign In"
    expect(page).to have_no_content("Sign In")
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("James")

    visit root_path
    click_on "Sign Out"
    expect(page).to have_no_content("Sign Out")
    expect(page).to have_content("Sign In")
    expect(page).to have_no_content("James")
  end
end
