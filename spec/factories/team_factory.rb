FactoryGirl.define do
  factory :team, class: Team do
    name "Test team"
    association :captain, factory: :user
  end
end