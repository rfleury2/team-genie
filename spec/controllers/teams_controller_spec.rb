require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let(:team) { FactoryGirl.create(:team) }

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
        response = post :create, { team: { name: "Test Team" } }
      end

      it "creates a new team with the params" do
        expect(created_team).to be_a Team
        expect(created_team.name).to eq "Test Team"
      end

      it "establishes user as the captain" do
        expect(created_team.captain).to eq user
      end

      it "redirects to root path" do
        expect(response).to redirect_to team_path(created_team)
      end
    end

    describe "invalid team" do
      before do 
        response = post :create, { team: { name: nil } }
      end

      it "does not save team" do
        expect{response}.to_not change{Team.count}
      end

      it "generates the proper error" do
        expect(assigns(:errors)).to eq ["Name can't be blank"]
      end

      it "renders the new team template" do
        expect(response).to render_template :new
      end
    end
  end

  describe "GET edit" do
    before { response = get :edit, { id: team.id } }

    it "renders edit partial" do
      expect(response).to render_template '_edit'
    end
  end

  describe "PUT update" do
    before do
      response = put :update, { id: team.id, team: { name: "Updated" } }
      team.reload
    end

    it "updates the team's information" do
      expect(team.name).to eq "Updated"
    end

    it "redirects to team path" do
      expect(response).to redirect_to team_path(team)
    end
  end

  describe "DELETE destroy" do
    before do
      response = delete :destroy, id: team.id 
    end

    it "destroys the current team" do
      # This may be flaky.  Check for different implementation
      expect(Team.count).to eq 0
    end

    it "redirects to root path" do
      expect(response).to redirect_to root_path
    end
  end
end