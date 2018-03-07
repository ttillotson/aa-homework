# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create(username: "Phillip J Fry")
User.create(username: "SupaHotFire")
User.create(username: "Ian Malcolm")
User.create(username: "Frankie Muniz")
User.create(username: "Cody Banks")
User.create(username: "Anthony Anderson")
User.create(username: "Mel Gibson")
User.create(username: "Kevin Hart")
