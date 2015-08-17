FactoryGirl.define do
  factory :user, class: User do
    name "John Person"
    email  "email@example.com"
    password "password"
    password_confirmation "password"
    role "player"
  end

  factory :admin_user, class: User do
    name "John Person"
    email  "email@example.com"
    password "password"
    password_confirmation "password"
    role "admin"
  end
end