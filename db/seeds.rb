# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Preparing database for seed data...'

User.destroy_all
Beer.destroy_all

puts 'Database ready for seed data.'

puts 'Creating users...'

emily = User.new(:name => 'Emily Ellison', email: 'emilyellison986@gmail.com', password: 'foobar', password_confirmation: 'foobar')
emily.admin = true
emily.save

neo = User.create(:name => 'Nehemiah Ellison', email: 'nehemiah.ellison@gmail.com', password: 'foobar', password_confirmation: 'foobar')

lisa = User.create(:name => 'Lisa Alvine', email: 'lisa.alvine@gmail.com', password: 'foobar', password_confirmation: 'foobar')

alex = User.create(:name => 'Alex Slobovnik', email: 'slobo@gmail.com', password: 'foobar', password_confirmation: 'foobar')

puts 'Users created.'

puts 'Creating beers...'

beer_array = [ 'Left Hand Milk Stout', 'Allagash White', 'Harvest Moon', 'Tumbler', 'Left Hand Sawtooth',
  "Little Sumpin' Sumpin'", 'Lagunitas IPA', 'Cane & Ebel', "Ebel's Weiss", 'Prairie Path Ale',
  'Northwind Imperial Stout', 'The Bitter End', 'Lagunitas The CENSORED Rich Copper Ale', 
  'Kennebunkport Pumpkin Ale', 'Kennebunkport Winter Ale', 'Kennebunkport Blueberry Ale', 'Kennebunkport IPA',
  'Victory Golden Monkey', 'Allagash Black' ]
  
price_array = [ 7.0, 7.5, 8.0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0, 11.5, 12.0 ]

user_id_array = [ emily.id, neo.id, lisa.id, alex.id ]

100.times do 
  
  beer = Beer.new(name: beer_array.sample, price: price_array.sample)
  beer.user_id = user_id_array.sample
  beer.save
  
end

puts 'Beers created.'