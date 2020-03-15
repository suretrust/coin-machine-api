# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Transaction.delete_all
p 'All transactions deleted!'
Coin.delete_all
p 'All coins deleted!'
ApiUser.delete_all
p 'All api_users deleted!'
Admin.delete_all
p 'All admins deleted!'

ApiUser.create(email: 'foo@bar.com')
Admin.create(email: 'admin@admin.com')
