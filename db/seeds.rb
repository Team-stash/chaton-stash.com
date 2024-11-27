require 'faker'

# 20.times do
#   Item.create!(
#     name: Faker::Commerce.product_name,                     
#     description: Faker::Lorem.paragraph(sentence_count: 3), 
#     price: Faker::Commerce.price(range: 5.0..100.0),        
#     stock: rand(0..50),                                     
#     image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['cat']), 
#   )
# end

# # Créer 10 utilisateurs fictifs
# 10.times do
#   User.create(
#     email_address: Faker::Internet.email,
#     password_digest: BCrypt::Password.create('password'),
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name
#   )
# end

# Créer 10 produits fictifs
10.times do
  Item.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price(range: 1..1000.0),
    stock: Faker::Number.between(from: 1, to: 100),
    image_url: Faker::LoremFlickr.image(size: "300x300")
  )
end


# # Créer 4 paniers fictifs associés à des utilisateurs
# 5.times do
#   user = User.all.sample
#   cart = Cart.create(user: user)
# # Créer 4 paniers fictifs associés à des utilisateurs
# 5.times do
#   user = User.all.sample
#   cart = Cart.create(user: user)

#   # Ajouter des items (produits) au panier (via la table cart_items)
#   rand(1..10).times do
#     item = Item.all.sample
#     CartItem.create(cart: cart, item: item)
#   end
# end
#   # Ajouter des items (produits) au panier (via la table cart_items)
#   rand(1..10).times do
#     item = Item.all.sample
#     CartItem.create(cart: cart, item: item)
#   end
# end

# # Créer 10 commandes fictives associées à des utilisateurs
# 10.times do
#   user = User.all.sample
#   order = Order.create(
#     user: user,
#     total_price: Faker::Commerce.price(range: 20..500.0)
#   )
# # Créer 10 commandes fictives associées à des utilisateurs
# 10.times do
#   user = User.all.sample
#   order = Order.create(
#     user: user,
#     total_price: Faker::Commerce.price(range: 20..500.0)
#   )

#   # Associer des produits à chaque commande via la table items
#   rand(1..10).times do
#     item = Item.all.sample
#     cart = Cart.all.sample
#     CartItem.create(cart: cart, item: item) # Ou associer à une autre logique pour les commandes
#   end
# end
#   # Associer des produits à chaque commande via la table items
#   rand(1..10).times do
#     item = Item.all.sample
#     cart = Cart.all.sample
#     CartItem.create(cart: cart, item: item) # Ou associer à une autre logique pour les commandes
#   end
# end



user = User.create!(
  email_address: "rails@admin.com",
  password: "123456",
  password_confirmation: "123456",
  first_name: "Chaton",
  last_name: "Fan",
  role: :admin
)
puts "User created: #{user.email_address}"
# # Créer 4 paniers fictifs associés à des utilisateurs
# 5.times do
#   user = User.all.sample
#   cart = Cart.create(user: user)

#   # Ajouter des items (produits) au panier (via la table cart_items)
#   rand(1..10).times do
#     item = Item.all.sample
#     CartItem.create(cart: cart, item: item)
#   end
# end

# # Créer 10 commandes fictives associées à des utilisateurs
# 10.times do
#   user = User.all.sample
#   order = Order.create(
#     user: user,
#     total_price: Faker::Commerce.price(range: 20..500.0)
#   )

#   # Associer des produits à chaque commande via la table items
#   rand(1..10).times do
#     item = Item.all.sample
#     cart = Cart.all.sample
#     CartItem.create(cart: cart, item: item) # Ou associer à une autre logique pour les commandes
#   end
# end



user = User.create!(
  email_address: "rails@admin.com",
  password: "123456",
  password_confirmation: "123456",
  first_name: "Chaton",
  last_name: "Fan"
)
puts "User created: #{user.email_address}"