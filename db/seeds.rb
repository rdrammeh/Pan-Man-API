# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Game.delete_all
User.delete_all

User.create(password: "test123", email: "user1@mail.com", username: "user1")
Game.create(score: 45, start_time: Time.now, end_time: Time.now+600, user:  User.first)
solid = User.create(password: "test123", email: "user2@mail.com", username: "user2")
Game.create(score: 1500, start_time: Time.now, end_time: Time.now+6000, user:  User.last)
User.create(password: "test123", email: "user3@mail.com", username: "user3")
Game.create(score: 30, start_time: Time.now, end_time: Time.now+345, user:  User.last)
User.create(password: "test123", email: "user4@mail.com", username: "user4")
Game.create(score: 0, start_time: Time.now, end_time: Time.now+5, user:  User.last)
User.create(password: "test123", email: "user5@mail.com", username: "user5")
Game.create(score: 10, start_time: Time.now, end_time: Time.now+44, user:  User.last)
User.create(password: "test123", email: "user6@mail.com", username: "user6")
Game.create(score: 36, start_time: Time.now, end_time: Time.now+300, user:  solid)
Game.create(score: 34, start_time: Time.now, end_time: Time.now+60, user:  solid)
Game.create(score: 50, start_time: Time.now, end_time: Time.now+200, user:  solid)
Game.create(score: 14, start_time: Time.now, end_time: Time.now+120, user:  solid)
Game.create(score: 1000, start_time: Time.now, end_time: Time.now+3000, user:  solid)
Game.create(score: 869, start_time: Time.now, end_time: Time.now+2500, user:  solid)
