# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning seeds, destroying all users, events, participations, creations, likes..."
User.destroy_all
Event.destroy_all
Participation.destroy_all
Creation.destroy_all
Like.destroy_all
EventCreation.destroy_all

puts "creating seeds"
user_one = User.create(user_name: "Juliette", email: "jules@fichtl.com", password: "123456")
user_two = User.create(user_name: "Rita", email: "rita@rita.com", password: "123456")
user_three = User.create(user_name: "Romain", email: "romain@gille.com", password: "123456")
user_four = User.create(user_name: "Max", email: "max@maximilian.com", password: "123456")
user_five = User.create(user_name: "Sankar", email: "sankar@lewagon.com", password: "123456")

event_one = Event.create(user: user_one, location: "Studio one, Munich", description: "Exihibition of my paintings")
event_two = Event.create(user: user_two, location: "Community center, East London", description: "Show of my hat collection")

creation_one = Creation.create(name: "Painting", description: "Sunflower", user: user_one)
creation_two = Creation.create(name: "Painting", description: "Bird", user: user_one)
creation_three = Creation.create(name: "Painting", description: "Butterfly", user: user_one)
creation_four = Creation.create(name: "Painting", description: "Portrait of Nuri", user: user_one)
creation_five = Creation.create(name: "Painting", description: "Early morning on the beach", user: user_one)

like_one = Like.create(user: user_one, creation: creation_one)
like_two = Like.create(user: user_two, creation: creation_one)
like_three = Like.create(user: user_three, creation: creation_one)
like_four = Like.create(user: user_four, creation: creation_two)
like_five = Like.create(user: user_five, creation: creation_two)

# adding creations to an event
add_creation_one = EventCreation.create(creation: creation_one, event: event_one)
add_creation_two = EventCreation.create(creation: creation_two, event: event_one)
add_creation_three = EventCreation.create(creation: creation_three, event: event_one)
add_creation_four = EventCreation.create(creation: creation_four, event: event_one)
add_creation_five = EventCreation.create(creation: creation_five, event: event_one)


participation_one = Participation.create(user: user_one, event: event_one)
participation_two = Participation.create(user: user_two, event: event_one)
participation_three = Participation.create(user: user_three, event: event_one)
participation_four = Participation.create(user: user_four, event: event_one)
participation_five = Participation.create(user: user_five, event: event_one)
