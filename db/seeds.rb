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

team = Team.first_or_create!(captain: user, name: "Manchester Apart")
team2 = Team.first_or_create!(captain: admin, name: "America States United")
team3 = Team.first_or_create!(captain: user, name: "Air Bud")

teams = [team, team2, team3]

teams.each do |team|
	puts 'runs teams.each'
	10.times do
		new_user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
		membership = team.memberships.first_or_create!(player: new_user)
		puts membership
		puts 'yay for more than one'
		5.times do |index|
			game = team.games.create!(time: DateTime.now + (7 * index + 1).days)
			team.memberships.each do |membership|
				game.rsvps.first_or_create!(membership: membership)
			end
		end
	end
end

10.times do
	user = User.first_or_create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
end
