Item.destroy_all
User.destroy_all
Order.destroy_all
OrderItem.destroy_all

users = []
items = []
orders = []
number_photo = rand(300..399)

20.times do |x|
  items << Item.create!(
      title: Faker::Creature::Cat.name,
      description: Faker::Lorem.paragraph,
      image_url: "https://placekitten.com/200/#{number_photo}",
      price: rand(1...5))
  x += 1
  puts "#{x}/20 items created"
end

10.times do |x|
  users << User.create!(
      email: Faker::Name.first_name + "@yopmail.com" ,
      password: "1234567"
  )
  x += 1
  puts "#{x}/10 users created"
end

30.times do |x|
  orders << Order.create!(
      user: users.sample,
      stripe_customer_id: Faker::Code.ean
  )
  x += 1
  puts "#{x}/30 users created"
end

30.times do |x|
  OrderItem.create!(
      order: orders.sample,
      item: items.sample,
      quantity: rand(1...5),
      total_price:  rand(5...200)
  )
  x += 1
  puts "#{x}/30 OrderItem created"
end

