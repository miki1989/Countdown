# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
miki = User.create(first_name: 'Mikolaj', last_name: 'Heller', email: 'quizzing89@gmail.com', password: 'enter', password_confirmation: 'enter', role: 'admin')