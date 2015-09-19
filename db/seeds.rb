# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.first_or_create!(name: "First Last", email: "user@example.com", password: "password", password_confirmation: "password")
admin = User.first_or_create!(name: "Ricardo Fleury", email: "admin@admin.com", password: "password", password_confirmation: "password")
admin.send(:assign_role, "admin")

team = Team.first_or_create!(captain: user, name: "Test Team 1")
Team.first_or_create!(captain: user, name: "Test Team 2")

10.times do
	user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
	team.memberships.create!(player: user) if team.memberships.count < 15
end

3.times { User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password') }
