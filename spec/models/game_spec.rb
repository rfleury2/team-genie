require 'rails_helper'

RSpec.describe Game, type: :model do
	it { should validate_presence_of :time }
	it { should validate_presence_of :team }
	
	it { should belong_to :team }
end
