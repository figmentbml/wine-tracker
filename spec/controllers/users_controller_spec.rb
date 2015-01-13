require 'rails_helper'

describe UsersController do
  before do
    password = 'password'
    @admin = create_user(
    name: "Admin",
    password: password,
    email: "admin@email.com",
    advanced: true,
    admin: true)
    @member = create_user(
    name: "Member",
    password: password,
    email: "member@email.com")
    @user = create_user(
    name: "User",
    password: password,
    email: "user@email.com")
  end

  describe "#index" do
    it "redirects not logged in users" do
      get :index

      expect(response).to redirect_to(signin_path)
    end

    xit "renders 404 for members" do
      get :index

      expect(response.status).to eq(404)
    end

    it "allows admins to see" do
      session[:user_id] = @admin.id
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "#show" do
    it "redirects not logged in users" do
      get :show, id: @user.id

      expect(response).to redirect_to(signin_path)
    end

    xit "renders 404 for members" do
      session[:user_id] = @member.id
      get :show, id: @user.id

      expect(response.status).to eq(404)
    end

    it "allows admins to see" do
      session[:user_id] = @admin.id
      get :show, id: @user.id

      expect(response.status).to eq(200)
    end

    it "allows self to see" do
      session[:user_id] = @member.id
      get :show, id: @member.id

      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "allows members to see" do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    xit "allows members to create" do
      post :create

      expect(response.status).to eq(300)
    end

  end

  describe "#edit" do
    it "redirects not logged in users" do
      get :edit, id: @user.id

      expect(response).to redirect_to(signin_path)
    end

    xit "renders 404 for not self or admin" do
      session[:user_id] = @member.id
      get :edit, id: @user.id

      expect(response.status).to eq(404)
    end

    it "allows admins to edit" do
      session[:user_id] = @admin.id
      get :edit, id: @user.id

      expect(response.status).to eq(200)
    end

    it "allows self to edit" do
      session[:user_id] = @member.id
      get :edit, id: @member.id

      expect(response.status).to eq(200)
    end
  end

  describe "#update" do
    it "redirects not logged in users" do
      patch :update, id: @user.id, user: {name: "Sam"}

      expect(response).to redirect_to(signin_path)
    end

    xit "renders 404 for not self or admin" do
      session[:user_id] = @member.id
      patch :update, id: @user.id, user: {name: "Sam"}

      expect(response.status).to eq(404)
    end

    it "allows admins to update" do
      session[:user_id] = @admin.id
      patch :update, id: @user.id, user: {name: "Sam"}

      expect(response.status).to eq(302)
    end

    it "allows self to update" do
      session[:user_id] = @member.id
      patch :update, id: @member.id, user: {name: "Sam"}

      expect(response.status).to eq(302)
    end
  end

  describe "#destroy" do
    it "redirects not logged in users" do
      delete :destroy, id: @user.id

      expect(response).to redirect_to(signin_path)
    end

    it "allows admins to delete" do
      session[:user_id] = @admin.id
      count = User.count
      delete :destroy, id: @user.id

      expect(count-1).to eq(User.count)
      expect(response).to redirect_to(root_path)
    end

    it "allows self to delete" do
      session[:user_id] = @member.id
      count = User.count
      delete :destroy, id: @member.id

      expect(count-1).to eq(User.count)
    end

    xit "renders 404 for not self or admin" do
      session[:user_id] = @member.id
      delete :destroy, id: @user.id

      expect(response.status).to eq(404)
    end
  end




end
