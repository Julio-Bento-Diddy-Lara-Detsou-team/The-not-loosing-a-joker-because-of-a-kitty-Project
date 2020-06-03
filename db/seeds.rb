# Reset tables in the database
Item.destroy_all
User.destroy_all
Order.destroy_all
OrderItem.destroy_all
Cart.destroy_all

# Useful variables for the seeding
users = []
items = []
orders = []

# Seed Items
20.times do |x|
  number_photo = rand(300..399)

  items << Item.create!(
      title: Faker::Creature::Cat.name,
      description: Faker::Lorem.paragraph,
      image_url: "https://placekitten.com/200/#{number_photo}",
      price: rand(1..5))

  puts "#{x + 1}/20 items created"
end

# Seed Users
10.times do |x|
  user = User.create!(
      email: Faker::Name.first_name + "@yopmail.com" ,
      password: "1234567"
  )

  users << user

  # Seed Cart
  Cart.create!(user_id: user.id)

  puts "#{x + 1}/10 users created"
end

# Seed Order
30.times do |x|
  orders << Order.create!(
      user: users.sample,
      stripe_customer_id: Faker::Code.ean
  )

  puts "#{x + 1}/30 Orders created"
end

# Seed OrderItem
30.times do |x|
  OrderItem.create!(
      order: orders.sample,
      item: items.sample,
      quantity: rand(1...5),
      total_price: rand(5...200)
  )

  puts "#{x + 1}/30 OrderItem created"
end
