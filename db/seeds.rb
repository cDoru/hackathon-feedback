# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

users = []
10.times do
  users << User.create(name: Faker::Name.name, email: Faker::Internet.email)
end

users.each do |user|
  request = FeedbackRequest.create(title: "WTF?", description: "no idea", requester: user)
  request.invitees << user
end