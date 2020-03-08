# Desired Behavior for an #each method:
#  - Iterate through each element of the array argument
#  - Yield, passing the current element into a block.
#  - Return the calling object

def each(array)
  index = 0

  while index < array.size
    element = array[index]
    yield element
    index += 1
  end
  
  array
end

each([1, 2, 3]) { |num| puts num }

# Code Execution Tracing:
#  1. Execution begins at method invokation on line 18.
#  2. Execution continues to line 6, where the local variable array is assigned the argument [1, 2, 3].
#     The block { |num| puts num } is made implicitly available. 
#  3. Execution continues to line 7, where the local variable index is assigned the integer 0.
#  4. The while loop is implemented on line 9, where the conditional statement index < array.index is evaluated.
#  5. On the first iteration, the conditional statement for the while loop evaulates to true, so the code within th
