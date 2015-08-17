# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "First Last", email: "user@user.com", password: "password", password_confirmation: "password")
admin = User.create!(name: "Ricardo Fleury", email: "admin@admin.com", password: "password", password_confirmation: "password")
admin.assign_role("admin")