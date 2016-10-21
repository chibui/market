ActiveRecord::Base.connection.disable_referential_integrity do
  # This file should contain all the record creation needed to seed the database with its default values.
  # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
  #
  # Examples:
  #
  #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  #   Character.create(name: 'Luke', movie: movies.first)

  r1 = Role.create({name: "Regular", description: "Can read items"})
  r2 = Role.create({name: "Seller", description: "Can read and create items. Can update and destroy own items"})
  r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})
  r4 = Role.create({name: "Suspended", description: "No actions"})

  u1 = User.create({name: "Sally's Shop", email: "sally@example.com", password: "123456", password_confirmation: "123456", role_id: r1.id, contact: "Sally", phone: 43536356, address: "235 sdflskdf", abn: "1234", bio: "bio", image: "", tos_status: true })
  u2 = User.create({name: "Sue's Shop", email: "sue@example.com", password: "123456", password_confirmation: "123456", role_id: r2.id, contact: "Sue", phone: 43536356, address: "235 sdflskdf", abn: "1234", bio: "bio", image: "", tos_status: true })
  u3 = User.create({name: "Kev's Shop", email: "kev@example.com", password: "123456", password_confirmation: "123456", role_id: r2.id, contact: "Kev", phone: 43536356, address: "235 sdflskdf", abn: "1234", bio: "bio", image: "", tos_status: true })
  u4 = User.create({name: "chi", email: "chi@example.com", password: "123456", password_confirmation: "123456", role_id: r3.id, contact: "Market", phone: 43536356, address: "235 sdflskdf", abn: "1234", bio: "bio", image: "", tos_status: true })


end
