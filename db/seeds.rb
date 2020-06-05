# Reset tables in the database
Item.destroy_all
User.destroy_all
Order.destroy_all
OrderItem.destroy_all
Cart.destroy_all
Category.destroy_all

# Useful variables for the seeding
categories = []
users = []
items = []
orders = []


# Seed Create Category
categories << Category.create!(title: 'Espiègle')
categories << Category.create!(title: 'Affectueux')
categories << Category.create!(title: 'Timide')
categories << Category.create!(title: 'Enragé')

# Seed Items
20.times do |x|
  number_photo = x + 200

  items << Item.create!(
    title: Faker::Creature::Cat.name,
    description: Faker::Lorem.paragraph,
    image_url: "https://placekitten.com/200/#{number_photo}",
    price: rand(1..5),
    category_id: Category.all.sample.id)


  puts "#{x + 1}/20 items created"
end

# Seed Users
5.times do |x|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph,
    email: Faker::Name.first_name + "@yopmail.com",
    password: "123456",
    password_confirmation: "123456",
    address: Faker::Address.street_address,
    zipcode: Faker::Address.zip_code,
    is_admin: false
  )

  users << user

  # Seed Cart
  Cart.create!(user_id: user.id)

  puts "#{x + 1}/10 user created"
end

# Create Admin
User.create!(
  first_name: "Admin",
  last_name: "Admin",
  description: Faker::Lorem.paragraph,
  email: "kittysweety@yopmail.com",
  password: "azertyu",
  password_confirmation: "azertyu",
  address: Faker::Address.street_address,
  zipcode: Faker::Address.zip_code,
  is_admin: true
)
puts "One Admin Added"
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
