require 'rails_helper'

describe "User" do

  it "has unique email" do
    User.create!(
    name: "James",
    email: "dean@email.com",
    password: "123",
    password_confirmation: "123"
    )
    user = User.new(
    name: "Jimmy",
    email: "jimmy@email.com",
    password: "456",
    password_confirmation: "456"
    )
    expect(user.valid?).to be(true)
    expect(user.errors[:email].present?).to eq(false)

    user = User.new(
    name: "James",
    email: "dean@email.com",
    password: "123",
    password_confirmation: "123"
    )
    expect(user.valid?).to be(false)
    expect(user.errors[:email].present?).to eq(true)
  end


end
