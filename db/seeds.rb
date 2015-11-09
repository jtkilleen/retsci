# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
jersey = Item.find_by(name: "Adidas Jersey")
Item.create!(name: "Nike Dunks")
dunks = Item.find_by(name: "Nike Dunks")
Item.create!(name: "Nike Street Basketball")
nikebasketball = Item.find_by(name: "Nike Street Basketball")
basketball = Category.find_by(name: "Basketball")
Category.create!(name: "Adidas")
adidas = Category.find_by(name: "Adidas")
john = User.find_by(name: "John Smith")
User.create!(name: "David Jones")
david = User.find_by(name: "David Jones")
Category.create!(name: "Nike")
nike = Category.find_by(name: "Nike")
Category.create!(name: "Clothing")
clothing = Category.find_by(name: "Clothing")
Category.create!(name: "Shoes")
shoes = Category.find_by(name: "Shoes")
Category.create!(name: "Balls")
balls = Category.find_by(name: "Balls")

jersey.categories << adidas
jersey.save
adidas.items << jersey
adidas.save

jersey.categories << basketball
jersey.save
basketball.items << jersey
basketball.save

jersey.categories << clothing
jersey.save
clothing.items << jersey
clothing.save

dunks.categories << shoes
dunks.save
shoes.items << dunks
shoes.save

dunks.categories << nike
dunks.save
nike.items << dunks
nike.save

dunks.categories << basketball
dunks.save
basketball.items << dunks
basketball.save

nikebasketball.categories << basketball
nikebasketball.save
basketball.items << nikebasketball
basketball.save

nikebasketball.categories << nike
nikebasketball.save
nike.items << nikebasketball
nike.save

nikebasketball.categories << balls
nikebasketball.save
balls.items << nikebasketball
balls.save

john.items << jersey
john.save
jersey.users << john
jersey.save

david.items << dunks
david.save
dunks.users << david
dunks.save
