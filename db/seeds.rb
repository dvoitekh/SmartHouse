# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(role: 'admin', name: 'Admin', email: 'admin@example.com', password: 'password',
             password_confirmation: 'password')
User.create!(role: 'client', name: 'John Doe', email: 'client@example.com', password: 'password',
             password_confirmation: 'password')
User.create!(role: 'client', name: 'Frank Sinatra', email: 'sinatra@example.com', password: 'password',
             password_confirmation: 'password')

Category.create!(name: 'TV')
Category.create!(name: 'Fridge')
Category.create!(name: 'Solar inverter')
Category.create!(name: 'Conditioner')
Category.create!(name: 'Washing machine')

Device.create!(bt_mac_address: '11:22:33:44:55:66', category_id: 1, name: 'Panasonic FullHD',
               power: -0.25, validity: true, active: false, user_id: 2)
Device.create!(bt_mac_address: '99:88:77:66:55:44', category_id: 2, name: 'Bosh A50',
               power: -0.5, validity: true, active: true, user_id: 3)
Device.create!(bt_mac_address: '00:11:00:11:00:11', category_id: 3, name: 'ABB 500',
               power: 0.5, validity: true, active: true, user_id: 2)

Aggregate.create!(device_id: 1, date: Date.today, energy: -20)
Aggregate.create!(device_id: 1, date: Date.yesterday, energy: -25)
Aggregate.create!(device_id: 3, date: Date.today, energy: 50)
Aggregate.create!(device_id: 3, date: Date.yesterday, energy: 65)

TimeGap.create!(start: '8:00', end: '12:00')
TimeGap.create!(start: '18:00', end: '20:00')
TimeGap.create!(start: '10:00', end: '14:00')
TimeGap.create!(start: '20:00', end: '23:00')
