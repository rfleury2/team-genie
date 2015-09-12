require 'rails_helper'

RSpec.describe Membership, type: :model do
	let(:user) { FactoryGirl.create(:user) }
	let(:team) { FactoryGirl.create(:team, captain: user) }

	it { should belong_to(:player).class_name("User") }
	it { should belong_to(:team) }

	describe "base case" do
		it "defaults to 0 amount owed" do

		end
	end
end
