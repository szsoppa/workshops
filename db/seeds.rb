# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
admin = User.create(email: 'admin@example.com', password: 'administrator',	firstname: 'Admin',	lastname: 'Administator', admin: true)
users = []
5.times { |i| users << User.create(email: "user#{i}@internet.com", password: "supersecurepass", firstname: "User#{i}", lastname: "User#{i}", admin: false) }

# Categories
rock = Category.create name: 'rock'
rap = Category.create name: 'rap'

rock.products.create(
	title: 'How to Dismantle an Atomic Bomb',
	description: 'A 2004 U2 album. Quite entertaining, actually.',
	price: '40',
	user: users[0])
rock.products.create(
	title: 'New Adventures in Hi-Fi',
	description: 'Very good album by R.E.M. Released in 1997. Kinda rocky by their standards.',
	price: '30',
	user: users[1])
rap.products.create(
	title: 'Straight Outta Compton',
	description: 'A breakthrough gangsta rap album by N.W.A., dated back to 1988.',
	price: '15',
	user: users[2])
rap.products.create(
	title: 'Get Rich Or Die Tryin',
	description: 'Debut album by Fiddy Cent released in 2003.',
	price: '20',
	user: users[3])

Product.all.each do |product|
	3.times { product.reviews.create(content: 'Some interesting review....', rating: rand(5)+1, user: users[rand(5)+1]) }
end
