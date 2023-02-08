require 'rspec'
require './lib/dealership'

RSpec.describe Dealership do
  it 'exists' do 
    dealership = Dealership.new("Acme Auto", "123 Main Street")

    expect(dealership).to be_a(Dealership)
  end

  xit 'has an inventory' do 
    dealership = Dealership.new("Acme Auto", "123 Main Street")
  
    expect(dealership.inventory).to eq([])
  end
end

