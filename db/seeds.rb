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

Bike.create(name: "Neo", make: "Specialized", model: "Tarmac SL7", description: "One bike to rule them all", serial_number: 1, user_id: user.id, year: 2023)
Bike.create(name: "Caaderific", make: "Cannondale", model: "CAAD10", description: "CAAD have them all", serial_number: 2, user_id: user.id, year: 2014)
Bike.create(name: "Dream bike", make: "Cervelo", model: "Soloist", description: "Do it all race bike", serial_number: 3, user_id: user.id, year: 2024)

Bike.create(name: "Standert", make: "Standert", model: "Kreissage", description: "Do it all race bike", serial_number: 3, user_id: user2.id, year: 2024)

puts "\n== Seeding bikes complete 🚲 =="

puts "\n== Seeding is all done 🪴 =="
