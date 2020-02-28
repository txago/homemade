require "faker"
require "open-uri"

Product.destroy_all
User.destroy_all

puts "Building fake users, products and orders"

users_attributes = [
  {
    email: Faker::Internet.email,
    id: 40,
    password: "123456"
  },
  {
    email: Faker::Internet.email,
    id: 41,
    password: "123456"
  },
  {
    email: Faker::Internet.email,
    id: 42,
    password: "123456"
  }
]

User.create!(users_attributes)

10.times do
  file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
  product = Product.new(
    name: Faker::Book.title,
    description: Faker::Lorem.paragraph_by_chars,
    price: rand(1..100),
    quantity: rand(1..100),
    user_id: rand(40..42)
  )
  product.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  product.save!
end

puts "All done!"
