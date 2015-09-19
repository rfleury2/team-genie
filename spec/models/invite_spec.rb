require 'rails_helper'

RSpec.describe Invite, type: :model do
	let(:user) { FactoryGirl.create(:user) }
	let(:team) { FactoryGirl.create(:team, captain: user) }

	it { should validate_presence_of :email }

  it { should belong_to(:inviter).class_name("User") }
  it { should belong_to(:team) }
end
