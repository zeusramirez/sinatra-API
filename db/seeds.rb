puts "Deleting data..."
User.destroy_all
Menu.destroy_all
Order.destroy_all
Restaurant.destroy_all

puts "Creating User..."
User.create(
    name: "Greg",
    delivery_instructions: "Ring doorbell",
    phone: 8889580569,
    address: "11 Broadway 2nd floor, New York, NY 10004"
)

puts "Creating Restaurant..."
4.times do
    Restaurant.create(
        name: Faker::Company.name,
        address: Faker::Address.street_address,
        phone: Faker::PhoneNumber.cell_phone
    )
end

puts "Creating Menu..."
20.times do
Menu.create(
    name: Faker::Food.dish,
    restaurant_id: Restaurant.ids.sample,
    price: rand(10..100)
)
end

puts "Creating Order..."
2.times do
Order.create(
 user_id: User.ids.sample,
 menu_id: Menu.ids.sample,
 status: "Delivered"
)
end

puts "Seeding done!"