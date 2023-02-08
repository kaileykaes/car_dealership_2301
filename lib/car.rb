class Car
    attr_reader :make_model, :monthly_payment, :loan_length

  def initialize(make_model, monthly_payment, loan_length)
      @make_model = make_model
      @monthly_payment = monthly_payment
      @loan_length = loan_length
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
end