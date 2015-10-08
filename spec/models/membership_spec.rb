require 'rails_helper'

RSpec.describe Membership, type: :model do
	let(:user) { FactoryGirl.create(:user) }
	let(:team) { FactoryGirl.create(:team, captain: user) }

	it { should belong_to(:player).class_name("User") }
	it { should belong_to(:team) }

	it { should validate_presence_of :player }
	it { should validate_presence_of :team }

	describe "base case" do
		let(:membership) { user.memberships.create(team: team) }

		it "gets associations correct" do
			expect(membership.player).to eq user
			expect(membership.team).to eq team
		end

		it "defaults to 0 amount owed" do
			expect(membership.amount_owed).to eq 0
		end

		it "defaults to player for role" do
			expect(membership.role).to eq 'player'
		end
	end

	describe ".create_captain_membership" do
		before { Membership.create_captain_membership(team, user) }

		it "creates a captain membership to the proper team" do
			membership = Membership.last
			expect(membership.player).to eq user
			expect(membership.role).to eq 'captain'
			expect(membership.team).to eq team
		end
	end
end
