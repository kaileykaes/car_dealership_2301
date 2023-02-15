require 'rspec'
require './lib/dealership'
require'./lib/car'

RSpec.describe Dealership do
before(:each) do 
  @dealership = Dealership.new("Acme Auto", "123 Main Street")
end
  describe '#properties' do
  it 'exists' do 
    expect(@dealership).to be_a(Dealership)
  end

  it 'has an inventory' do   
    expect(@dealership.inventory).to eq([])
  end

  it 'has an inventory' do
    expect(@dealership.inventory_count).to eq(0)
  end

  it 'stores cars in @inventory' do
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    expect(@dealership.inventory).to be_a(Array)
  end

  it 'counts how many cars are in its inventory' do
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    expect(@dealership.inventory_count).to eq(2)
  end

  it 'has_inventory? no' do
    expect(@dealership.has_inventory?).to eq(false)
  end

  it 'has_inventory? yes' do
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    @dealership.add_car(car_3)
    @dealership.add_car(car_4)
    expect(@dealership.has_inventory?).to eq(true)
  end

  it 'returns cars by make' do
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    @dealership.add_car(car_3)
    @dealership.add_car(car_4)
    expect(@dealership.cars_by_make("Ford")).to eq([car_1])
  end

  it 'determines how wealthy the dealership is' do
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    @dealership.add_car(car_3)
    @dealership.add_car(car_4)
    expect(@dealership.total_value).to eq(156000)
  end

  it 'stores details in a hash' do
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    @dealership.add_car(car_3)
    @dealership.add_car(car_4)
    expect(@dealership.details).to eq({
    "total_value" => 156000, "address" => "123 Main Street"
    })
    end
end
end

