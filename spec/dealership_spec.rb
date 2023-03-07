require 'rspec'
require './lib/dealership'
require'./lib/car'

RSpec.describe Dealership do
before(:each) do 
  @dealership = Dealership.new("Acme Auto", "123 Main Street")
  @car_1 = Car.new("Ford Mustang", 1500, 36)
  @car_2 = Car.new("Toyota Prius", 1000, 48)
  @car_3 = Car.new("Toyota Tercel", 500, 48)
  @car_4 = Car.new("Chevrolet Bronco", 1250, 24)
end

describe '#initialize' do
  it 'exists' do 
    expect(@dealership).to be_a(Dealership)
  end

  it 'has an inventory' do   
    expect(@dealership.inventory).to eq([])
  end

  it 'has an inventory count' do
    expect(@dealership.inventory_count).to eq(0)
  end

  it 'has an address' do
    expect(@dealership.address).to eq("123 Main Street")
  end

  it 'stores cars in inventory' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    expect(@dealership.inventory).to be_a(Array)
    expect(@dealership.inventory).to eq([@car_1, @car_2])
  end

  it 'counts how many cars are in its inventory' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    expect(@dealership.inventory_count).to eq(2)
  end

  it 'has_inventory? no' do
    expect(@dealership.has_inventory?).to eq(false)
  end

  it 'has_inventory? yes' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)
    expect(@dealership.has_inventory?).to eq(true)
  end

  it 'returns cars by make' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)
    expect(@dealership.cars_by_make("Ford")).to eq([@car_1])
  end

  it 'determines how wealthy the dealership is' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)
    expect(@dealership.total_value).to eq(156000)
  end

  it 'stores details in a hash' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)
    expect(@dealership.details).to eq({
    "total_value" => 156000, "address" => "123 Main Street"
    })
  end
  
  it 'finds average_price_of_car' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)
    expect(@dealership.average_price_of_car).to eq("39,000")
  end

  it 'sorts by price' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)
    expect(@dealership.cars_sorted_by_price).to eq([@car_3, @car_4, @car_2, @car_1])
  end
end
end

