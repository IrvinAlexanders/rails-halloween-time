# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'faker'


puts "Testing..."
puts "Cleaning up db"

user_image = URI.open('https://source.unsplash.com/random')
user = User.create!(
  email: Faker::Internet.safe_email,
  password: 'abc123123abc',
  address: 'cl 54 # 50a 41'
  )
  user.photo.attach(io: user_image, filename: 'user.png', content_type: 'image/png')

10.times do
  costume_image = URI.open('https://source.unsplash.com/random')
  costume = Costume.create!(
    name: Faker::Superhero.name,
    user: user,
    category: Costume::CATEGORIES.sample,
    description: Faker::Commerce.product_name,
    price: rand(20..99)
  )
  costume.photo.attach(io: costume_image, filename: 'halloween.png', content_type: 'image/png')

  puts "#{costume.name} was created!"

  rand(4).times do
    Review.create!(
      content: Faker::Restaurant.review,
      costume: costume,
      rating: rand(1..5)
    )
  end
end
