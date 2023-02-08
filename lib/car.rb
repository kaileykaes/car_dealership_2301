class Car
    attr_reader :make_model, :monthly_payment, :loan_length
    attr_accessor :color

  def initialize(make_model, monthly_payment, loan_length, color = nil)
      @make_model = make_model
      @monthly_payment = monthly_payment
      @loan_length = loan_length
      @color = color
  end

  def make 
    make_model.split(' ').first
  end

  def model
    make_model.split(' ').pop
  end

  def total_cost
    @loan_length * @monthly_payment
  end

  def paint!(color)
    @color = color
  end 
end