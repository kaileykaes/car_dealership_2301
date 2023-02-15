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
    hash_deets = Hash.new
    hash_deets["total_value"] = total_value
    hash_deets["address"] = @address
    hash_deets
  end
end 