# Desired Behavior for the Reduce Method:
#   1. Iterate through each element of an array.
#   2. Set the accumulator object to the default starting value manually set by method caller, or default value of 0.
#   3. Yield to a block, where the block's return value is assigned to an accumulator variable.
#   4. Return the accumulator variable.

def reduce(array, default = nil)
  unless default
    accumulator = 0 # Setting the starting accumulator value.
  else
    accumulator = default
  end
  index = 0

# Yielding to the block for each element
  while index < array.size
    element = array[index]
    accumulator = yield accumulator, element
    index += 1
  end
 
  accumulator # Returning the accumulator at the end of iteration.
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

=begin
  Code Execution Tracing:
    1. Execution begins at method invocation on lines 27 to 29.
    2. Execution continues to method implementation on line 7. For line 7, the array local variable is assigned the argument passed in,
    which in this case is the Array [1, 2, 3, 4, 5]. The default local variable is assigned nil unless an argument is passed explicitly.
 
=end
