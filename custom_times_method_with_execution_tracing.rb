=begin
  Desired Behavior: Formal Pseudo Code
  Given an integer: iterations
    - SET counter = 0
    - REPEAT-UNTIL counter == iterations
      - YIELD: pass counter as an argument to block
      - SET counter += 1
    - RETURN iterations
=end

def times(iterations)
  counter = 0

  while counter < iterations
    yield counter
    counter += 1
  end

  iterations
end

5.times { |num| puts num }
