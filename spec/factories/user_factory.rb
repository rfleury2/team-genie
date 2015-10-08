FactoryGirl.define do
  factory :user, class: User do |f|
    f.name Faker::Name.name
    f.sequence(:email) {|n| "person#{n}@example.com" }
    f.password "password"
    f.password_confirmation "password"
    f.role "player"
  end

  factory :admin_user, class: User do
    name "John Person"
    email  "email@example.com"
    password "password"
    password_confirmation "password"
    role "admin"
  end
end