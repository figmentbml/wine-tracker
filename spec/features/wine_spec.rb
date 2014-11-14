require 'rails_helper'

feature "Wines" do
  scenario "user can delete wine from index page" do
    Wine.create!(
    rating: '4',
    grape_varietal: "Malbec",
    country: "USA",
    state: "CO",
    vineyard: "something crazy",
    year: '1999'
    )

    visit root_path
    click_on "Show Wines"
    click_on "Delete"
    expect(page).to have_content("Wine was successfully deleted")
    expect(page).to have_no_content("something crazy")
  end

end
