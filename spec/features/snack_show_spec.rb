require "rails_helper"

RSpec.describe "Snack Show Page", type: :feature do
  it "displays snack information and where to buy it" do
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

    visit "/snacks/#{skittles.id}"

    expect(page).to have_content(skittles.name)
    expect(page).to have_content(skittles.price)
    expect(page).to have_content(dons.location)
    expect(page).to have_content(turing.location)

    within "#machine-info-#{dons.id}" do
      expect(page).to have_content(dons.average_snack_price.round(2))
      expect(page).to have_content(dons.snack_count)
    end

    within "#machine-info-#{turing.id}" do
      expect(page).to have_content(turing.average_snack_price.round(2))
      expect(page).to have_content(turing.snack_count)
    end
  end
end
