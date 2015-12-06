class Nnd
  def initialize(first_number, second_number)
    @first_number = first_number.to_i
    @second_number = second_number.to_i
    raise "invalid numbers" unless numbers_valid?
    display_output if output_valid?
  end

  private

  def numbers_valid?
    @first_number != 0 && @second_number != 0
  end

  def standard_calculation
    @first_number * @second_number
  end

  def calculated_output
    "#{starting_number_plus_difference}#{multiplication_of_differences}".to_i
  end

  def output_valid?

  end
end
