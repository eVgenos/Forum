# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.delete_all
Category.delete_all

categories = { 'HTML' => 'HyperText Markup Language',
               'Ruby' => 'Динамический, рефлективный, интерпретируемый высокоуровневый язык программирования.',
               'JavaScript' => 'Прототипно-ориентированный сценарный язык программирования. Является реализацией языка ECMAScript.',
               'PHP' => 'Это язык программирования, специально разработанный для написания web-приложений (сценариев), исполняющихся на Web-сервере. Аббревиатура PHP означает “Hypertext Preprocessor".'}

categories.each do |c, b|
    user.categories.create!(title: c, body: b)
end

User.create!
