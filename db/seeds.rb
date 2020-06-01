# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
User.destroy_all
Order.destroy_all

number_photo = rand ( 300..399)
20.times do |x|
  Item.new(title: Faker::Creature::Cat.name,
           description: Faker::Lorem.paragraph,
           image_url: "https://placekitten.com/200/#{number_photo}",
           price: rand(1...5))
  x += 1
  puts "#{x}/20 items created"
end

10.times do |x|
  User.create(email: Faker::Name.name + "@yopmail.com" ,
              encrypted_password: 1234567
              )
  x += 1
  puts "#{x}/10 users created"
end

30.times do |x|
  Order.create(
      stripe_customer_id: Faker::Code.ean
  )
  x += 1
  puts "#{x}/30 users created"
end
