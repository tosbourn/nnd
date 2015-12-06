require 'pry'
class Nnd
  def initialize(first_number, second_number, output_method = ToScreen.new)
    @first_number = first_number.to_i
    @second_number = second_number.to_i
    @output_method = output_method
    @closest_multiple_of_ten = closest_multiple_of_ten
    raise InvalidNumbers unless numbers_valid?
  end

  def output_answer
    @output_method.show(display_output)
  end

  private

  def closest_multiple_of_ten
    if length(@first_number) > length(@second_number)
      10 ** length(@first_number)
    else
      10 ** length(@second_number)
    end
  end

  def numbers_valid?
    @first_number > 0 && @second_number > 0
  end

  def standard_calculation
    @first_number * @second_number
  end

  def calculated_output
    if multiplication_of_differences.to_i < 0
      if length(starting_number_plus_difference.to_i) < length(@closest_multiple_of_ten)
        value = starting_number_plus_difference.to_s.ljust((length(@closest_multiple_of_ten) - 1), '0')
        value.to_i + multiplication_of_differences.to_i
      else
        starting_number_plus_difference.to_i + multiplication_of_differences.to_i
      end
    else
      "#{starting_number_plus_difference}#{multiplication_of_differences}".to_i
    end
  end

  def starting_number_plus_difference
    @first_number + second_difference
  end

  def multiplication_of_differences
    value = first_difference * second_difference
    if length(value) < length(@closest_multiple_of_ten)
      value.to_s.rjust((length(@closest_multiple_of_ten) - 1), '0')
    else
      value
    end
  end

  def length(value)
    value.to_s.delete('-').size
  end

  def first_difference
    @first_number - @closest_multiple_of_ten
  end

  def second_difference
    @second_number - @closest_multiple_of_ten
  end

  def display_output
    [
      "Original Multiplication: #{@first_number} * #{@second_number}",
      "We need to work out a common base that is a multiple of 10",
      "Using Base: #{@closest_multiple_of_ten}",
      "For each number we need to work out the difference between it and the base and multiple it",
      "Multiplied out differences padded with zeros: #{multiplication_of_differences}",
      "Add the first number to the second difference",
      "The first number added to the second number's difference: #{starting_number_plus_difference}",
      "Finally we place the padded number after that last number we calculated",
      "Answer: #{calculated_output}"
    ]
  end
end

class InvalidNumbers < StandardError; end

class ToScreen
  def show(content)
    Array(content).each do |line|
      puts line
    end
  end
end
