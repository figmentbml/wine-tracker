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
    @winery = create_winery(
    name: "Winery",
    street: "15 Main St",
    city: "Lousiville",
    state: "CO",
    zip: 22907,
    phone_number: "999-999-9999"
    )
    @wine = create_wine(
    grape_varietal: "Blend",
    name: "Best",
    winery_id: @winery.id
    )
  end

  describe "#index" do
    it "allows non-logged in users to see" do
      get :index

      expect(response).to render_template(:index)
    end

    it "allows members to see" do
      session[:user_id] = @member.id
      get :index

      expect(response).to render_template(:index)
    end

    it "allows advanced members to see" do
      session[:user_id] = @advanced.id
      get :index

      expect(response).to render_template(:index)
    end

    it "allows admins to see" do
      session[:user_id] = @admin.id
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "#show" do
    it "allows non-logged in users to see" do
      get :show, id: @wine.id

      expect(response).to render_template(:show)
    end

    it "allows members to see" do
      session[:user_id] = @member.id
      get :show, id: @wine.id

      expect(response).to render_template(:show)
    end

    it "allows advanced members to see" do
      session[:user_id] = @advanced.id
      get :show, id: @wine.id

      expect(response).to render_template(:show)
    end

    it "allows admins to see" do
      session[:user_id] = @admin.id
      get :show, id: @wine.id

      expect(response).to render_template(:show)
    end
  end

  describe "#new" do
    it "redirects to signin path if not logged" do
      get :new

      expect(response).to redirect_to(signin_path)
    end

    it "allows members to new" do
      session[:user_id] = @member.id
      get :new

      expect(response).to render_template(:new)
    end

    it "allows advanced members to new" do
      session[:user_id] = @advanced.id
      get :new

      expect(response).to render_template(:new)

    end

    it "allows admins to new" do
      session[:user_id] = @advanced.id
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    it "redirects to signin path if not logged" do

      post :create, wine: {name: "Merlot", grape_varietal: "Merlot"}

      expect(response).to redirect_to(signin_path)
    end

    it "allows members to create" do
      session[:user_id] = @member.id

      post :create, wine: {name: "Merlot", grape_varietal: "Merlot", winery_id: @winery.id}

      expect(Wine.last.name).to eq("Merlot")
    end

    it "allows advanced members to create" do
      session[:user_id] = @advanced.id

      post :create, wine: {name: "Merlot", grape_varietal: "Merlot", winery_id: @winery.id}

      expect(Wine.last.name).to eq("Merlot")
    end

    it "allows admins to create" do
      session[:user_id] = @admin.id

      post :create, wine: {name: "Merlot", grape_varietal: "Merlot", winery_id: @winery.id}

      expect(Wine.last.name).to eq("Merlot")
    end
  end

  describe "#edit" do
    it "redirects to signin path if not logged" do
      get :edit, id: @wine.id

      expect(response).to redirect_to(signin_path)
    end

    it "does not allow members to edit" do
      session[:user_id] = @member.id

      get :edit, id: @wine.id

      expect(response.status).to eq(404)
    end

    it "does not allow advanced members to edit" do
      session[:user_id] = @advanced.id

      get :edit, id: @wine.id

      expect(response.status).to eq(404)
    end

    it "allows admins to edit" do
      session[:user_id] = @admin.id

      get :edit, id: @wine.id

      expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    it "does not allow members to update" do
      session[:user_id] = @member.id

      patch :update, id: @wine.id, wine: {name: "The best"}

      expect(response.status).to eq(404)
    end

    it "does not allow advanced members to update" do
      session[:user_id] = @advanced.id

      patch :update, id: @wine.id, wine: {name: "The best"}

      expect(response.status).to eq(404)
    end

    it "allows admins to update" do
      session[:user_id] = @admin.id

      patch :update, id: @wine.id, wine: {name: "The best"}

      expect(response.status).to eq(302)
    end
  end

  describe "#destroy" do
    it "does not allow members to destroy" do
      session[:user_id] = @member.id

      delete :destroy, id: @wine.id

      expect(response.status).to eq(404)
    end

    it "does not allow advanced to destroy" do
      session[:user_id] = @advanced.id

      delete :destroy, id: @wine.id

      expect(response.status).to eq(404)
    end

    it "allows admins to destroy" do
      session[:user_id] = @admin.id

      delete :destroy, id: @wine.id

      expect(response.status).to eq(302)
    end
  end



end
