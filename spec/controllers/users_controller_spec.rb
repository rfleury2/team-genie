require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET new" do
    before do 
      get :new
    end

    it 'renders new user page' do
      expect(response).to render_template(:new)
    end
  end  

  describe "POST create" do
    describe "valid user" do
      
      let(:created_user) { User.find_by_name("Paolo Maldini") }

      before do 
        post :create, { user: { name: "Paolo Maldini", email: "pmaldini@acmilan.it", password: "sosovalid", password_confirmation: "sosovalid" } }
      end

      it "creates a new user with the params" do
        expect(created_user).to be_a User
        expect(created_user.name).to eq "Paolo Maldini"
        expect(created_user.email).to eq "pmaldini@acmilan.it"
      end

      it "new user is assigned 'player' role" do
        expect(created_user.role).to eq "player"
      end

      it "redirects to root path" do
        expect(
          post :create, { user: { name: "Franco Baresi", email: "fbaresi@acmilan.it", password: "sosovalid", password_confirmation: "sosovalid" } }
          )
          .to redirect_to root_path
      end
    end

    describe "invalid users" do
      it "processes blank user errors" do
        post :create, { user: { name: "", email: "", password: "", password_confirmation: "" } }
        errors = assigns(:errors)
        expect(errors).to be_a Array
        expect(errors).to include("Name can't be blank")
        expect(errors).to include("Password can't be blank")
        expect(errors).to include("Email can't be blank")
      end

      it "processes email uniqueness errors" do
        post :create, { user: { name: "Paolo Maldini", email: "pmaldini@acmilan.it", password: "sosovalid", password_confirmation: "sosovalid" } }
        post :create, { user: { name: "Alessandro Nesta", email: "pmaldini@acmilan.it", password: "sosovalid", password_confirmation: "sosovalid" } }
        expect(assigns(:errors)).to include("Email has already been taken")
      end

      it "processes password confirmation error" do
        post :create, { user: { name: "Paolo Maldini", email: "pmaldini@acmilan.it", password: "sosovalid", password_confirmation: "" } }
        expect(assigns(:errors)).to include("Password confirmation doesn't match Password")
      end

      it "renders new path with errors" do
        hello = post :create, { user: { name: "", email: "", password: "", password_confirmation: "" } }
        expect(hello).to render_template :new
        expect(assigns(:errors)).to be_a Array
      end
    end
  end
end