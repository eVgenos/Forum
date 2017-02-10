# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
User.delete_all
user = User.create!(name: 'Evgeniy', email: 'evgenos2709@gmail.com', password: '1111')

categories = %w(HTML Ruby JavaScript PHP)

categories.each do |c|
    user.categories.create!(title: c)
end