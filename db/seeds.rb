# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SnackMachine.destroy_all
Machine.destroy_all
Snack.destroy_all
Owner.destroy_all

owner = Owner.create!(name: "Sam's Snacks")
dons  = owner.machines.create!(location: "Don's Mixed Drinks")
turing  = owner.machines.create!(location: "Turing's Basement")

snickers = Snack.create!(name: "Snickers", price: 1.50)
cheetos = Snack.create!(name: "Cheetos", price: 1.75)
skittles = Snack.create!(name: "Skittles", price: 1.25)
funions = Snack.create!(name: "Funions", price: 2.50)
power_bar = Snack.create!(name: "Power Bar", price: 2.00)

dons.snacks << [cheetos, snickers, skittles]
turing.snacks << [skittles, funions, power_bar]
