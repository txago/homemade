require 'faker'

puts 'criando produtos...'
Product.destroy_all

10.times do
  produto = Product.new(
    name: Faker::Book.title,
    description: Faker::Book.genre,
    price: 12_99,
    quantity: 10,
    user_id: 1
  )
  produto.save!
end

puts 'criou 10 produtos!'
