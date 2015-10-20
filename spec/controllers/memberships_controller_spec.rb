require 'rails_helper'

RSpec.describe MembershipsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:team) { FactoryGirl.create(:team) }
  before { allow(controller).to receive(:current_user) { user } }


  describe "GET index" do
  	pending ""
  end

  describe "POST create" do
  	describe "existing user" do
			before do
				team.games.create(time: DateTime.now)
				request = post :create, {
					team_id: team.id,
					email: user.email
				}
			end

			it "creates a membership properly" do
				membership = Membership.find_by(player: user)
				expect(membership.team).to eq team
				expect(membership.player).to eq user
				expect(membership.role).to eq 'player'
			end

			it "creates rsvps for games" do
				game = team.games.first
				rsvp = Rsvp.last
				membership = Membership.find_by(player: user)
				expect(rsvp.game).to eq game
				expect(rsvp.membership).to eq membership
			end
  	end

  	describe "new user" do
			before do
				request = post :create, {
					team_id: team.id,
					email: 'new@user.com'
				}
			end

			it "does not create a membership" do
				expect{request}.to_not change{Membership.count}
			end

			it "creates the proper invite" do
				invite = Invite.find_by(email: 'new@user.com')
				expect(invite.team).to eq team
			end
			# TODO: Verify mailer was fired off
  	end
	end

	describe "DELETE destroy" do
		# before do
		# 	membership = user.memberships.create(team: team)
		# 	request = delete :destroy, { id: membership.id }
		# end

		it "pending"
	end
end
