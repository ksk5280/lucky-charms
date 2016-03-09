# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.expand_path("app/assets/images/filename", __dir__)

charms = Category.create(title: "Charms", created_at: Time.now, image: "charms.jpg")
potions = Category.create(title: "Potions", created_at: Time.now, image: "felix_felicis.jpg")
clothes = Category.create(title: "Clothes", created_at: Time.now, image: "lucky_socks.jpg")

charms.items << Item.create(title: "Lucky Penny", description: "A shiny heads-up penny you found in the road!", price: 999 , image: File.new(Rails.root.join("spec", "support", "cartoon_penny.png"))
charms.items << Item.create(title: "Horseshoe", description: "Keep the open side pointed up so the luck doesn't drain out!", price: 1499, image: "horseshoe.png")
charms.items << Item.create(title: "Lucky Cat", description: "Wave Back!", price: 2499, image: "lucky_cat.png")

potions.items << Item.create(title: "Felix Felicis", description: "A luck-potion so powerful even it's placebo effects make you a better keeper!", price: 9999, image: "felix_felicis.jpg")
potions.items << Item.create(title: "Love Potion #9", description: "It won't force anyone to fall in love with you, that would be creepy, but it will make you luckier in love (if you're not creepy). 9th try at the formula. We're pretty sure we've got it right this time.", price: 9999, image: "love_potion_9.jpg")
potions.items << Item.create(title: "And the Crowd Goes Mild!", description: "Sometimes you just want to be able to make that shot with the wadded up paper in the trash can across the room. You won't make big bucks off this one, but you'll probably get chuckles of approval.", price: 4999, image: "mild_luck_potion.jpg")

clothes.items << Item.create(title: "Lucky Pat Wey Jersey", description: "A game worn jersey from former NHL player, Pat Wey!", price: 29999 , image: "pat_wey_jersey.jpg")
clothes.items << Item.create(title: "Game Day Sock", description: "Worn by one fan during every home game played on a Thursday in the month of September, but only for night games - and his team won EVERY(both) TIME!", price: 1099, image: "lucky_game_socks.jpg")
clothes.items << Item.create(title: "Peyton Manning Tighty Whities", description: "We're not really sure how these were obtained. They sure smell like they were game-worn. Gotta be lucky, right?", price: 99999, image: "tighty_whities.jpg")

User.create(username: "johndoe", password: "password", role: 0, first_name: "John", last_name: "Doe", address: "1510 Blake Street")
User.create(username: "janedoe", password: "password", role: 0, first_name: "Jane", last_name: "Doe", address: "1511 Blake Street")
User.create(username: "user", password: "password", role: 0, first_name: "Tim", last_name: "Finnigan", address: "1234 Walker Street")
User.create(username: "admin", password: "password", role: 1, first_name: "Anon", last_name: "Ymous", address: "The cloud")
