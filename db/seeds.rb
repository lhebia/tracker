# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "\n== Seeding the database with fixtures 🌱 =="

user = User.create(email: "user@lhebia.com", password: "password", username: "User", first_name: "User", last_name: "Dude")
user2 = User.create(email: "user2@lhebia.com", password: "password", username: "User2", first_name: "User2", last_name: "Dude")

puts "\n== Seeding users complete 👨🏻‍💻 =="

bike = Bike.create(name: "Neo", make: "Specialized", model: "Tarmac SL7", description: "One bike to rule them all", serial_number: 1, user_id: user.id, year: 2023)
Bike.create(name: "Caaderific", make: "Cannondale", model: "CAAD10", description: "CAAD have them all", serial_number: 2, user_id: user.id, year: 2014)
Bike.create(name: "Dream bike", make: "Cervelo", model: "Soloist", description: "Do it all race bike", serial_number: 3, user_id: user.id, year: 2024)

bike2 = Bike.create(name: "Standert", make: "Standert", model: "Kreissage", description: "Do it all race bike", serial_number: 3, user_id: user2.id, year: 2024)

puts "\n== Seeding bikes complete 🚲 =="

Ride.create(name: "The longest ever", date: Date.current, start_time: DateTime.now - 2.hours, end_time: DateTime.now, distance: 160, elevation: 250, description: "It was hella long", user_id: user.id, bike_id: bike.id)
Ride.create(name: "A long ride", date: Date.current - 2.days, start_time: DateTime.now - 48.hours, end_time: DateTime.now - 46.hours, distance: 100, elevation: 200, description: "It was long", user_id: user.id, bike_id: bike.id)
Ride.create(name: "Wow, that was long", date: Date.current - 3.days, start_time: DateTime.now - 72.hours, end_time: DateTime.now - 71.hours, distance: 80, elevation: 150, description: "It was quite long", user_id: user.id, bike_id: bike.id)

Ride.create(name: "My longest ever", date: Date.current, start_time: DateTime.now - 1.hour, end_time: DateTime.now, distance: 100, elevation: 200, description: "It was long", user_id: user2.id, bike_id: bike2.id)

puts "\n== Seeding rides complete 🎢 =="

puts "\n== Seeding is all done 🪴 =="
