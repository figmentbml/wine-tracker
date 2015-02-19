def create_user(overrides = {})
  User.create!(
  {
    name: "User",
    email: "dean@email.com",
    password: "123",
    admin: false,
    advanced: false,
  }.merge(overrides)
  )
end

def create_tasting_note(overrides = {})
  TastingNote.create!(
  {
    wine_rating: 5,
    aromas: "berries, jam",
    flavors: "tasty",
    notes: "fantastic"
  }.merge(overrides)
  )
end

def create_winery(overrides = {})
  Winery.create!(
  {
    name: "Winery",
    street: "15 Main St",
    city: "Lousiville",
    state: "CO",
    zip: 22907,
    phone_number: "999-999-9999"
  }.merge(overrides)
  )
end

def create_wine(overrides = {})
  Wine.create!(
  {
    grape_varietal: "Merlot",
    name: "Awesome Sauce",
    winery_id: 1
  }.merge(overrides)
  )
end
