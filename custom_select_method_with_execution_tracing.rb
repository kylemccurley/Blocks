=begin
  Custom select method desired behavior:
    1. Initialize a local variable output to an empty array
    2. Iterate through each element of array
    3. Yield each element to a block
    4. If the block evaluates to true:
      - Include the element in the new output array.
    5. Return the output array
=end

def select(arr)
  output = []
  index = 0

  while index < arr.size
    output << arr[index] if yield arr[index]
    index += 1
  end

  output
end

select([1, 2, 3]) { |num| num.odd? }

=begin
  Execution Tracing:
    - Execution begins at method invokation on line 23.
    - Execution continues to method implementation on line 11,
      the local variable arr is set to the array [1, 2, 3].
        - The block parameter num is left blank, with the block made implicitly available.
    - Execution continues to line 12, where the local variable output is set the an empty array.
    - Execution continues to line 13, where the local variable index is set to the integer 0.
    - Execution continues to line 15, where the while loop conditional statement is evaluated. On the first iteration, the conditional statement evaluates to true, so the code within the while loop's block is executed.
    - Execution continues to line 16, a guard clause is evaluated, if the yielded block's return value evaluates to true, the element at position index is appended to the output array.
    - Execution moves into the block on line 23, where the block parameter |num| is assigned the current element passed as an argument to the block. 
    - Execution continues to line 17, where the index integer is iterated up by 1.
    - Line 18 indicates the end of the code within the while loop.
    - Execution continues to line 15, where the conditional statement for the while loop is evaluated. If the conditional statement evaluates to false, then the block is no longer executed.
    - Execution continues to line 20, where the output array is implicitly returned since it is the last line of the method. 
    - Line 21 marks the end of the method, using the end reserved word. 
=end
