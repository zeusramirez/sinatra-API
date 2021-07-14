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
restaurants= ["https://static3.depositphotos.com/1003631/209/i/600/depositphotos_2099183-stock-photo-fine-table-setting-in-gourmet.jpg","https://img.freepik.com/free-photo/cozy-restaurant-with-people-waiter_175935-230.jpg?size=626&ext=jpg","https://pbs.twimg.com/media/EUZbHlbUEAANCyD?format=jpg&name=4096x4096","https://www.angelinasofwillistonpark.com/images/home-rotation-01.jpg","https://daundercard.files.wordpress.com/2013/06/bodega1.jpg"]
15.times do
    Restaurant.create(
        name: Faker::Company.name,
        address: Faker::Address.street_address,
        phone: Faker::PhoneNumber.cell_phone,
        image: restaurants.sample
    )
end

puts "Creating Menu..."
50.times do
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
 status: "Delivered",
 quantity: rand(1..5)
)
end

puts "Seeding done!"