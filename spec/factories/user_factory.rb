FactoryGirl.define do
  factory :valid_user, class: User do
    name "John Person"
    email  "email@example.com"
    password "password"
    password_confirmation "password"
  end
end