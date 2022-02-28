# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "creating user and event"
user_one = User.create(user_name: "Romain", email: "romain@gille.com", password: "123456")
event_one = Event.create(user: user_one, location: "Munich", description: "sculpture")
participation_one = Participation.create(user: user_one, event: event_one)
creation_one = Creation.create(name: "picture", description: "Sunflower", user: user_one)
like_one = Like.create(user: user_one, creation: creation_one)
make_event = EventCreation.create(creation: creation_one, event: event_one)
