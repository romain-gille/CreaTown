# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning seeds, destroying all users, events, creations..."
User.destroy_all
Event.destroy_all
# Participation.destroy_all
Creation.destroy_all
# Like.destroy_all
# EventCreation.destroy_all

user_data = [
  {
    user_name: "Julie",
    location: "Schwabing, Munich",
    email: "julie@julie.com",
    password: "julie@julie.com",
    description: "Hi, I am Julie. I live in the Schwabing neighborhood of Munich.
    I am a graphic designer and in my free time, I love to paint.",
    slug: "jul"
  },

  {
    user_name: "James",
    location: "Giesing, Munich",
    email: "james@james.com",
    password: "james@james.com",
    description: "Hello, my name is James. I am originally from Ireland and now I live
    in the Giesing neighborhood of Munich. I am in Munich because I am doing an apprenticeship,
    learning to brew beer. My favorite pasttime is photography. I have a drone and I love to take pictures with it.
    Have a look at my photos here on the app and let me know how you like them. I'd love to hear from you.",
    slug: "jam"
  },

  {
    user_name: "Hiromi",
    location: "Sendling, Munich",
    email: "hiromi@hiromi.com",
    password: "hiromi@hiromi.com",
    description: "Hi, my name is Hiromi. I am spending a year in Germany to learn German.
    I come from Japan. I love to cook and would love to share Japanese culture and food with you.",
    slug: "hir"
  },

  {
    user_name: "Rajesh",
    location: "Bogenhausen, Munich",
    email: "raj@raj.com",
    password: "raj@raj.com",
    description: "My name is Raj. I am an astrophysics professor at TU Munich. I
    collect comic books. Check out my collection!",
    slug: "raj"
  },

  {
    user_name: "Rita",
    location: "Au, Munich",
    email: "rita@rita.com",
    password: "rita@rita.com",
    description: "Hi, my name is Rita. I am originally from Rio and I moved to Munich last year. It's quite
    cold in Munich and I miss the tropical climate of Brazil. This is why I started cultivating tropical
    plants at the community greenhouse here in my neighborhood.",
    slug: "rit"
  }
]

users = {}
#  users = {jul: instance of user that gets created by the iteration, jul being key }
# slug is a technique to quickly identify the associated user data

puts "Creating users"

user_data.each do |data|
  user = User.new(user_name: data[:user_name], location: data[:location],
                  email: data[:email], password: data[:password], description: data[:description])
  slug = data[:slug]
  users[slug] = user
  user.save!
end

creation_data = [
  {
    name: "Linda with big earring",
    description: "Pastel - A4",
    category: "art",
    date: Date.new(2022, 2, 22),
    user: users["jul"],
    img_url: "https://images.squarespace-cdn.com/content/v1/60d1b5efecf0e13e48e9fbc7/efecbbc3-bc09-4709-b0f7-c54892a533da/IMG_2894%5B1%5D.jpg?format=500w"
  },

  {
    name: "Marilyn Shoes",
    description: "Oil on canvas",
    category: "art",
    date: Date.new(2022, 2, 22),
    user: users["jul"],
    img_url: "https://images.squarespace-cdn.com/content/v1/60d1b5efecf0e13e48e9fbc7/ccfee1da-f4f6-4cb2-97f7-1de8007cc32d/marilyn-shoe.jpg?format=500w"
  },

  {
    name: "Perfume bottle",
    description: "Watercolor",
    category: "art",
    date: Date.new(2022, 2, 22),
    user: users["jul"],
    img_url: "https://images.squarespace-cdn.com/content/v1/60d1b5efecf0e13e48e9fbc7/81d25535-0c17-4c76-b1e5-e6e0f3651075/IMG_3001.jpg?format=500w"
  },

  {
    name: "Udon noodle",
    description: "A traditional Japanese dish with noodles and broth",
    category: "cooking",
    date: Date.new(2022, 2, 28),
    user: users["hir"],
    img_url: "https://assets.bonappetit.com/photos/6018902c21494f6f6d02df84/1:1/w_2240,c_limit/Spices-Udon-in-Buttery-Tomato-and-Soy-Broth.jpg"
  },

  {
    name: "Rice bowl",
    description: "An appetizing mixture of rice, vegetables and salmon",
    category: "cooking",
    date: Date.new(2022, 3, 1),
    user: users["hir"],
    img_url: "https://assets.bonappetit.com/photos/58bd9e060109e601f57e3696/1:1/w_2240,c_limit/Naomi%20Recipe_02232017%20HEALTHYISH5314.jpg"
  },

  {
    name: "Beach",
    description: "From a trip to the wild west coast of Portugal.",
    category: "photography",
    date: Date.new(2021, 12, 7),
    user: users["jam"],
    img_url: "https://images.unsplash.com/photo-1520539852163-cbe5251b4f1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=707&q=80"
  },

  {
    name: "Forest in Bavaria",
    description: "I took this picture on a cold winter morning.",
    category: "photography",
    date: Date.new(2021, 12, 7),
    user: users["jam"],
    img_url: "https://images.unsplash.com/photo-1603739315857-8fc7017955ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
  },

  {
    name: "My comic book collection",
    description: "Spiderman, Tarzan, and much more.",
    category: "collections",
    date: Date.new(2021, 11, 7),
    user: users["raj"],
    img_url: "https://images.unsplash.com/photo-1620928572438-075c466c48da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
  },

  {
    name: "Monstera",
    description: "This one is already quite big, amazing how fast they grow",
    category: "garden",
    date: Date.new(2021, 12, 7),
    user: users["rit"],
    img_url: "https://i.pinimg.com/474x/90/3b/fb/903bfb247c92c3ca5246edd112830a2e.jpg"
  },

  {
    name: "Avocado",
    description: "It is really quite easy to grow avocados. All you need is a seed and some water.",
    category: "garden",
    date: Date.new(2021, 12, 7),
    user: users["rit"],
    img_url: "https://i.pinimg.com/564x/c1/50/44/c15044236283252af6e584ea8ac0a95d.jpg"
  }
]
#go through each creation_data and create creation object

creation_data.each do |data|
  creation = Creation.new(name: data[:name], description: data[:description], category: data[:category],
                          date: data[:date], user: data[:user])
  file = URI.open(data[:img_url])
  creation.photos.attach(io: file, filename: 'creation.jpg', content_type: 'image/jpg')
  creation.save!
end

puts "Creating creations :))"

events_data = [
  {
    user: users["jul"],
    location: "Munich, Schwabing",
    date: Date.new(2022, 3, 22),
    description: "Pop-Up Art Show at RaumEinsAtelier, Schwabing",
    slug: "event1",
    longitude: 48.15,
    latitude: 11.4,
    img_url: "https://img.posterlounge.de/img/products/640000/630477/630477_poster_l.jpg"
  },

  {
    user: users["jam"],
    location: "Munich, Giesinger Bräu",
    date: Date.new(2022, 3, 18),
    description: "The world from above - exibition of aerial photography",
    longitude: 48.15,
    latitude: 11.4,
    img_url: "https://images.unsplash.com/photo-1520539852163-cbe5251b4f1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=707&q=80"
  },

  {
    user: users["hir"],
    location: "Munich, Glockenbachwerkstatt",
    date: Date.new(2022, 1, 22),
    description: "Japanese home cooking with Hiromi",
    longitude: 48.15,
    latitude: 11.4,
    img_url: "https://d1oh9y2nmj4y5b.cloudfront.net/uploads/photo/filename/5468/RIMG4965.jpg"
  },

  {
    user: users["raj"],
    location: "Munich",
    date: Date.new(2022, 1, 24),
    description: "Better than comicon: Raj's comic book collection. Trade your comics, rent a cosplayer and much more.",
    longitude: 48.15,
    latitude: 11.4,
    img_url: "https://1yfd8w35xqq41q3ou63czp8h-wpengine.netdna-ssl.com/wp-content/uploads/2017/01/The-Future-of-Exhibition-Is-Here-The-Comic-Book-Convention.jpg"
  },

  {
    user: users["rit"],
    location: "Munich, Gemeindehaus St. Johann",
    date: Date.new(2022, 3, 22),
    description: "Gardening with Rita: what kinds of tropical plants are easy to grow in your own home.",
    longitude: 48.15,
    latitude: 11.4,
    img_url: "https://www.collinsdictionary.com/images/full/gardening_380327731_1000.jpg"
  }
]

puts "And finally creating events!"

events_data.each do |data|
  event = Event.new(user: data[:user], location: data[:location], date: data[:date], description: data[:description],
                    longitude: data[:longitude], latitude: data[:latitude])
  file = URI.open(data[:img_url])
  event.photo.attach(io: file, filename: "event.jpg", content_type: "image/jpg")
  event.save!
end
puts "creating participation"
Participation.create(user: User.all.first, event: Event.all.first)
