require 'rails_helper'

describe TastingNotesController do
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
      winery_id: @winery.id
    )
    @note = create_tasting_note(
      notes: "awesome",
      wine_rating: 5,
      user_id: @member.id,
      wine_id: @wine.id)
  end

  describe "#index" do
    it "redirects if you aren't logged in" do
      get :index

      expect(response).to redirect_to(signin_path)
    end

    it "allows members to see index" do
      session[:user_id] = @member.id
      get :index

      expect(response).to render_template(:index)
    end

    it "allows advanced to see index" do
      session[:user_id] = @advanced.id
      get :index

      expect(response).to render_template(:index)
    end

    it "allows admins to see everything" do
      session[:user_id] = @admin.id
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "#show" do
    it "allows members to see their notes" do
      session[:user_id] = @member.id
      get :show, id: @note.id

      expect(response).to render_template(:show)
    end

    it "allows admins to see notes" do
      session[:user_id] = @admin.id
      get :show, id: @note.id

      expect(response).to render_template(:show)
    end

  end

  describe "#new" do
    it "allows members to see a new form" do
      session[:user_id] = @member.id
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    it "allows members to create new notes" do
      session[:user_id] = @member.id
      post :create, tasting_note: {notes: "yummy", wine_rating: 4, wine_id: @wine.id}

      expect(TastingNote.last.notes).to eq("yummy")
    end

  end

  describe "#edit" do
    it "redirects non-logged in users" do
      get :edit, id: @note.id

      expect(response).to redirect_to(signin_path)
    end

    it "allows members to edit notes" do
      session[:user_id] = @member.id
      @member_note = create_tasting_note(notes: "horrible", user_id: @member.id, wine_id: @wine.id)
      get :edit, id: @member_note.id

      expect(response).to render_template(:edit)
    end

    it "allows admins to edit notes" do
      session[:user_id] = @admin.id
      get :edit, id: @note.id

      expect(response).to render_template(:edit)
    end

    it "does not allow members to edit other notes" do
    end
  end

  describe "#update" do
    it "allows members to update notes" do
      session[:user_id] = @member.id
      @member_note = create_tasting_note(notes: "horrible", user_id: @member.id, wine_id: @wine.id)
      patch :update, id: @member_note.id, tasting_note: {wine_rating: 2}

      expect(response).to redirect_to(tasting_note_path)
    end

    it "does not allow members to update other notes" do
    end

    it "allows admins to update notes" do
      session[:user_id] = @admin.id
      patch :update, id: @note.id, tasting_note: {wine_rating: 2}

      expect(response).to redirect_to(tasting_note_path)
    end

  end

  describe "#destroy" do
    it "allows members to destroy notes" do
      session[:user_id] = @member.id
      @member_note = create_tasting_note(notes: "horrible", user_id: @member.id, wine_id: @wine.id)
      count = TastingNote.count
      delete :destroy, id: @member_note.id

      expect(response).to redirect_to(tasting_notes_path)
      expect(count-1).to eq(TastingNote.count)
    end

    it "allows admins to destroy notes" do
      session[:user_id] = @admin.id
      count = TastingNote.count
      delete :destroy, id: @note.id

      expect(response).to redirect_to(tasting_notes_path)
      expect(count-1).to eq(TastingNote.count)
    end

    it "does not allow members to destroy other notes" do
    end
  end

end
