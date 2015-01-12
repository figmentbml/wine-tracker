require 'rails_helper'

describe WinesController do
  before do
    password = 'password'
    @member = create_user(
    name: "Member",
    password: password,
    email: "member@email.com")
    @advanced = create_user(
    name: "Advanced",
    password: password,
    email: "advanced@email.com",
    advanced: true)
    @admin = create_user(
    name: "Admin",
    password: password,
    email: "admin@email.com",
    advanced: true,
    admin: true)
  end

  describe "#index" do
    it "allows non-logged in users to see" do
    end

    it "allows members to see" do
    end

    it "allows advanced members to see" do
    end

    it "allows admins to see" do
    end
  end

  describe "#show" do
    it "allows non-logged in users to see" do
    end

    it "allows members to see" do
    end

    it "allows advanced members to see" do
    end

    it "allows admins to see" do
    end
  end

  describe "#new" do
    it "redirects to signin path if not logged" do
    end

    it "allows members to new" do
    end

    it "allows advanced members to new" do
    end

    it "allows admins to new" do
    end
  end

  describe "#create" do
    it "redirects to signin path if not logged" do
    end

    it "allows members to create" do
    end

    it "allows advanced members to create" do
    end

    it "allows admins to create" do
    end
  end

  describe "#edit" do
    it "redirects to signin path if not logged" do
    end

    it "does not allow members to edit" do
    end

    it "does not allow advanced members to edit" do
    end

    it "allows admins to edit" do
    end
  end

  describe "#update" do
    it "does not allow members to update" do
    end

    it "does not allow advanced members to update" do
    end

    it "allows admins to update" do
    end
  end

  describe "#destroy" do
    it "does not allow members to destroy" do
    end

    it "does not allow members to destroy" do
    end

    it "allows admins to destroy" do
    end
  end



end
