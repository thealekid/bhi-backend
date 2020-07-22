# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shop.destroy_all
User.destroy_all

Shop.create(name: "Freshcutz London", image_url: "", phone_number: 02036017007, opening_hours: "12pm - 11pm", address: "1 Hopton Rd", town: "Streatham", county: "London", country: "United Kingdom", postcode: "SW16 6EP", service: "Barbershop")
Shop.create(name: "Hair", image_url: "", phone_number: 02036017007, opening_hours: "12pm - 11pm", address: "1 Hopton Rd", town: "Streatham", county: "London", country: "United Kingdom", postcode: "SW16 6EP", service: "Barbershop")
