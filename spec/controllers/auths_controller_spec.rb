require 'rails_helper'

RSpec.describe AuthsController, type: :controller do
	let(:valid_user) { FactoryGirl.create(:user) }

  describe "GET new" do
    before do 
      get :new
    end

    it 'renders login page' do
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    describe "valid user" do
      before do
        post :create, user: { email: valid_user.email, password: valid_user.password }
      end

      it "redirects to the teams page" do    
        expect(response).to redirect_to :teams
      end

      it "creates permanent cookie in browser for remember me" do
        auth_cookie = response.cookies['auth_token']
        expect(auth_cookie).to be_a String
        expect(auth_cookie.length).to eq 22
        expect(auth_cookie['expires']).to be_nil
      end

      it "creates cookie with expiration date for no remember me" do
        # not implemented
      end

      it "there are no errors assigned" do
        expect(assigns(:errors)).to be_nil
      end
    end

    describe "invalid user" do
      before do
        post :create, user: { email: valid_user.email, password: "wrongpassword" }
      end

      it "renders the login page" do
        expect(response).to render_template :new
      end

      it "does not create a cookie" do
        expect(response.cookies).to be_empty
      end

      it "returns the correct error message" do
        expect(assigns(:errors)).to eq ["Your email or password are incorrect.  Please try again"]
      end
    end
  end
end