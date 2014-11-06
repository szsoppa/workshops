# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
User.create(email: 'admin@example.com', password: 'administrator',	firstname: 'Admin',	lastname: 'Administator', admin: true)
users = []
5.times { |i| users << User.new(email: "user#{i}@example.com", password: "userpassword", admin: false) }
users[0].firstname = "John"
users[1].firstname = "Michael"
users[2].firstname = "Rudy"
users[3].firstname = "Adam"
users[4].firstname = "Simon"

users[0].lastname = "Mayer"
users[1].lastname = "Jordan"
users[2].lastname = "Michaels"
users[3].lastname = "Lavigne"
users[4].lastname = "Gayes"

5.times { |u| users[u].save }

# Categories
phones = Category.create name: 'Phones'
computers = Category.create name: 'Computers'

computers.products.create(
	title: 'Apple Macbook Air',
	description: 'Brand new Apple Macbook Air with best performance ever!',
	price: '4000',
	user: users[0])
computers.products.create(
	title: 'Lenovo e530',
	description: 'Solid and functional for a good price!',
	price: '2500',
	user: users[1])
phones.products.create(
	title: 'OnePlus One',
	description: 'Best performance for low price, best deal you can take!',
	price: '1100',
	user: users[2])
phones.products.create(
	title: 'Apple Iphone 5s',
	description: 'Apple Iphone where design and performance meets!',
	price: '2000',
	user: users[3])

Product.all.each do |product|
	5.times { |x| product.reviews.create(content: 'Here is a great review example for this product #{x}', rating: rand(5)+1, user: users[rand(5)+1]) }
end
