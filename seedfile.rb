Category.create(title: "Charms", created_at: Time.now, image: "")
Category.create(title: "Potions", created_at: Time.now, image: "")
Category.create(title: "Clothes", created_at: Time.now, image: "")


Item.create(title: "", description: "", price: , image: "")
Item.create(title: "", description: "", price: , image: "")
Item.create(title: "", description: "", price: , image: "")


User.create(username: "johndoe", password: "password", role: 0, first_name: "John", last_name: "Doe", address: "1510 Blake Street")
User.create(username: "janedoe", password: "password", role: 0, first_name: "Jane", last_name: "Doe", address: "1511 Blake Street")
User.create(username: "user", password: "password", role: 0, first_name: "Little", last_name: "Timmy", address: "1234 Bleaker Street")
User.create(username: "admin", password: "password", role: 1, first_name: "Anon", last_name: "Ymous", address: "The cloud")
