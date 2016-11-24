# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

author = Author.create!(name: 'Mitch Mulligan', user_id: 1)

author.blogs.create!(title: 'Lord of the Fritos Hoops', content: 'The tasties of one rings.')
author.blogs.create!(title: 'Larry Potter', content: 'Ceramics made right.')
author.blogs.create!(title: 'To Kill a Mocking Jay', content: 'The capitol strikes back.')
