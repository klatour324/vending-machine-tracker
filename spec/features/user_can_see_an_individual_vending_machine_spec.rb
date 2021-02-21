require "rails_helper"

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "can see the name of all the snacks assoc with that machine and their price" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snickers = dons.snacks.create(name: "Snickers", price: 1.50)
    cheetos = dons.snacks.create(name: "Cheetos", price: 1.75)

    visit machine_path(dons)

    within "section.snacks-index" do
      expect(page).to have_content(snickers.name)
      expect(page).to have_content(snickers.price)
      expect(page).to have_content(cheetos.name)
      expect(page).to have_content(cheetos.price)
    end
  end
end
