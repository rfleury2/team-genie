class Seed
	def self.create_memberships(team)
		10.times do
			new_user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
			membership = team.memberships.create!(player: new_user)
		end
	end

	def self.create_games(team)
		5.times do |index|
			game = team.games.create!(time: DateTime.now + (7 * index + 1).days)
			team.memberships.each do |membership|
				game.rsvps.create!(membership: membership)
			end
		end
	end
end

user = User.create!(name: "First Last", email: "user@example.com", password: "password", password_confirmation: "password")
admin = User.create!(name: "Ricardo Fleury", email: "admin@admin.com", password: "password", password_confirmation: "password")
admin.send(:assign_role, "admin")

team = Team.create!(captain: user, name: "Manchester Apart")
team2 = Team.create!(captain: admin, name: "America States United")
team3 = Team.create!(captain: user, name: "Air Bud")
teams = [team, team2, team3]

teams.each do |team|
	Seed.create_memberships(team)
	Seed.create_games(team)
end

10.times do
	user = User.first_or_create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
end
