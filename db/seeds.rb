# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.delete_all
User.delete_all
Item.delete_all

r1 = Role.create({name: "Regular", description: "Can read items"})
r2 = Role.create({name: "Seller", description: "Can read and create items. Can update and destroy own items"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Sally's Shop", email: "sally@example.com", password: "123456", password_confirmation: "123456", role_id: r1.id, contact: "Sally", phone: 43536356, address: "235 sdflskdf", abn: "1234", bio: "bio", tos_status: true })
u2 = User.create({name: "Sue's Shop", email: "sue@example.com", password: "123456", password_confirmation: "123456", role_id: r2.id, contact: "Sue", phone: 43536356, address: "235 sdflskdf", abn: "1234", bio: "bio", tos_status: true })
u3 = User.create({name: "Kev's Shop", email: "kev@example.com", password: "123456", password_confirmation: "123456", role_id: r2.id, contact: "Kev", phone: 43536356, address: "235 sdflskdf", abn: "1234", bio: "bio", tos_status: true })
u4 = User.create({name: "chi", email: "chi@example.com", password: "123456", password_confirmation: "123456", role_id: r3.id, contact: "Market", phone: 43536356, address: "235 sdflskdf", abn: "1234", bio: "bio", tos_status: true })

i1 = Item.create({name: "Apple", description: "Delicious granny smith apple", origin: "sydney", min_order: 1, price: 3.99, user_id: u2.id})
i2 = Item.create({name: "Banana", description: "Sweet lady finger banana", origin: "melbourne", min_order: 1, price: 2.99, user_id: u2.id})
i3 = Item.create({name: "Orange", description: "Navel Orange", origin: "gold coast", min_order: 1, price: 9.99, user_id: u3.id})
i4 = Item.create({name: "Pineapple", description: "Super Pineapple", origin: "perth", min_order: 1, price: 19.99, user_id: u3.id})
