require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:user) { FactoryGirl.create(:user) }
	let(:team) { FactoryGirl.create(:team, captain: user) }

	it { should validate_presence_of :name }

  it { should belong_to(:captain).class_name("User") }

  describe "team captain association" do
    it "is a user" do
      expect(team.captain).to be_a User
    end

    it "is the proper captain" do
      expect(team.captain).to eq user
    end
  end
end
