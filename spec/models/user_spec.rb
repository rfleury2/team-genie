require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) { FactoryGirl.create(:valid_user) }

	it { should validate_presence_of :email }
	it { should validate_uniqueness_of :email }

	it { should validate_presence_of :name }
	
	it { should validate_presence_of :password }
	it { should validate_confirmation_of :password }

	it do
    should validate_length_of(:password).
      is_at_least(6).
      with_message("Please enter a password that is a minimum of 6 characters")
  end

  it "has auth_token" do
  	expect(user.auth_token).to_not be_nil
  end

  it "auth_token is of proper format" do
  	expect(user.auth_token).to be_a String
  	expect(user.auth_token.length).to eq 22
  end
end
