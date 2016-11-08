require_relative "stack"

class ReversePolishCalculator

  def initialize
    @stack = Stack.new
    @size = 0
  end

  def run(input)
    input = input.split(" ").to_a if input.is_a? String
    raise TooManyValues.new, "Too many values" if input == [] && @size > 1
    return @stack.pop if input == []
    character = input.slice!(0)
    number_check(character)
    run(input)
  end

  def number_check(character)
    if /\A\d+\z/.match(character)
      @stack.push(character.to_i)
      increment_size
    else
      symbol_check(character)
    end
  end

  def symbol_check(character)
    if /[*+-\/]/.match(character)
      math_operation(character)
    end
  end

  def math_operation(op)
    decriment_size
    numbers = pop_two
    @stack.push(numbers[0].send(op, numbers[1]))
  end

  private

  def increment_size
    @size += 1
  end

  def decriment_size
    @size -= 1
  end

  def check_stack(first, second)
    first == nil || second == nil
  end

  def pop_two
    second = @stack.pop
    first = @stack.pop
    raise NotEnoughValues.new, "Not enough values!" if check_stack(first, second)
    return [first, second]
  end
end

class NotEnoughValues < StandardError
end

class TooManyValues < StandardError
end

# While there are input tokens left
#   Read the next token from input.
  #   If the token is a value
    # Push it onto the stack.
  # Otherwise, the token is an operator (operator here includes both operators and functions).
    # It is already known that the operator takes n arguments.
    # If there are fewer than n values on the stack
      # (Error) The user has not input sufficient values in the expression.
    # Else, Pop the top n values from the stack.
    # Evaluate the operator, with the values as arguments.
    # Push the returned results, if any, back onto the stack.
# If there is only one value in the stack
  # That value is the result of the calculation.
# Otherwise, there are more values in the stack
  # (Error) The user input has too many values.
