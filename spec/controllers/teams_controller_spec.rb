require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  describe "GET new" do
    before do 
      get :new
    end

    it 'renders new team page' do
      expect(response).to render_template(:new)
    end
  end  

  describe "POST create" do
    let(:user) { FactoryGirl.create(:user) }
    before { allow(controller).to receive(:current_user) { user } }
    
    describe "valid team" do
      let(:created_team) { Team.find_by_name("Test Team") }

      before do 
        request = post :create, { team: { name: "Test Team" } }
      end

      it "creates a new team with the params" do
        expect(created_team).to be_a Team
        expect(created_team.name).to eq "Test Team"
      end

      it "establishes user as the captain" do
        expect(created_team.captain).to eq user
      end

      it "redirects to root path" do
        expect(request).to redirect_to root_path
      end
    end

    describe "invalid team" do
      before do 
        request = post :create, { team: { name: nil } }
      end

      it "does not save team" do
        expect{request}.to_not change{Team.count}
      end

      it "generates the proper error" do
        expect(assigns(:errors)).to eq ["Name can't be blank"]
      end

      it "renders the new team template" do
        expect(request).to render_template :new
      end
    end
  end
end