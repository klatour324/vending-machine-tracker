require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe "instance methods" do
    describe "#average_snack_price" do
      it "can find the average price of snacks for a machine" do
        owner = Owner.create!(name: "Sam's Snacks")
        dons  = owner.machines.create!(location: "Don's Mixed Drinks")
        snickers = dons.snacks.create!(name: "Snickers", price: 1.50)
        cheetos = dons.snacks.create!(name: "Cheetos", price: 1.75)
        skittles = dons.snacks.create!(name: "Skittles", price: 1.25)

        expect(dons.average_snack_price).to eq(1.50)
      end
    end
  end
end
