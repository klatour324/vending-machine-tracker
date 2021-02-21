# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Snack.destroy_all
Machine.destroy_all
Owner.destroy_all

owner = Owner.create!(name: "Sam's Snacks")
dons  = owner.machines.create!(location: "Don's Mixed Drinks")
snickers = dons.snacks.create!(name: "Snickers", price: 1.50)
cheetos = dons.snacks.create!(name: "Cheetos", price: 1.75)
