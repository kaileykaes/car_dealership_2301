class Dealership
  attr_reader :inventory, :name, :address

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def add_car(car)
    @inventory << car
  end

  def inventory_count
    @inventory.length
  end

  def has_inventory?
    if @inventory.length > 0
      true
    else
      false
    end
  end

  def total_value
    @inventory.sum do |car|
    car.total_cost
    end
  end

  def cars_by_make(make)
    @inventory.select do |car|
      car.make == make 
    end
  end

  def details
    dealership_deets = {}
    dealership_deets["total_value"] = total_value
    dealership_deets["address"] = @address
    dealership_deets
  end

  def average_price_of_car
    average = total_value / inventory_count
    average.to_s.insert(2, ',')
  end

  def cars_sorted_by_price
    inventory.sort_by{|car| car.total_cost}
  end
end 