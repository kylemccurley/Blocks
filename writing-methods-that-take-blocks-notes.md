---
title: "Writing Methods that Take Blocks"
tags: "Blocks,Closures,Yielding"
---
# Overview

### Guiding Questions:

-   How does a method treat a block being passed in?
-   What is an _implicit parameter_?
-   How do you pass a block to a method?
-   How to invoke a block from within a method.
-   What is the _purpose_ of the yield keyword.
-   What are the benefits of the yield keyword?
-   What is the meaning of a `LocalJumpError`
-   How to prevent a `LocalJumpError`
-   Method Implementation and Method Invokation
-   What is a block parameter?
-   What is a block local variable?
-   How does yield handle arguments?
-   What is arity?
-   What are some common use cases for blocks?
-   What are the roles of a method?
-   How to define an explicit block?
-   Benefits of an explicit block as compared to an implicit block?

#### How does a method treat a block being passed in?

-   Treats it like an argument. 
-   Every method in Ruby can take an optional block as an **implicit parameter**. 

```ruby
def a_method
   puts 'Hello' 
end

a_method { puts 'World' } # Implicit Parameter. Block is implicitly available, but isn't used.
```

#### What is an implicit parameter

-   A parameter/argument that is available for use within a method. Does not have to be used, but is available for use.

#### How do you pass a block to a method?

```ruby
  def a_method(str)
     yield
     puts str
  end

  a_method('World') { puts 'Hello' } # Tacking on the block to the end of method invocation.
```

-   Place the block at the end of the method's invocation.

#### How to invoke a block within a method:

-   Use the `yield` keyword.

```ruby
  def a_method
     yield 
  end

  a_method { puts 'Hello World' }
```

#### What is the purpose of the yield keyword

-   To invoke a block that has been made **implicitly** avaiable.
-   `yield` keyword executes a block. 

#### Benefits of the yield keyword?

-   Allows you to pass in arguments.
-   Developer can come in after this method is fully implemented and inject additional code, without modifying method implementation), by passing in a block of code. 

#### What is the meaning of the LocalJumpError?

-   It means that we have attempted to yield to a block within the method's implementation, and a block was not provided at method invocation.

```ruby
  def a_method(str)
     puts str
     yield # Will trigger a LocalJumpError
  end

  a_method('Hello')
```

#### How to prevent a LocalJumpError

-   Must use the Kernel#block_given? method to test if a block was passed before trying to yield a non-existant block.

```ruby
  def a_method(str)
    puts str
    yield if block_given? # Will not trigger a LocalJumpError.
  end

  a_method('Hello')
```

#### Method Implementation vs Method Invocation

```ruby
  # Method Implementation
  def a_method(str)
     puts str
     yield if block_given?
  end

  # Method Invocation
  a_method('Hello') { puts ' World' }
```

#### What is a block parameter?

-   A variable between two '|'s.
-   Example

```ruby
# Code omitted for brevity...
do |num|
  puts num
end
```

-   In the example above, |num| is considered a block parameter.

#### What is a Block Local Variable

-   The variable between the 2 |'s is the **block local variable**
-   Example:

```ruby
def a_method(str)
  yield str
end

a_method('Hello') { |string| puts string + ' World' }
```

-   In the example above for the block parameter `|string|`, `string` is the block local variable. 

#### How does yield handle arguments?

-   If you pass in too many arguments than otherwise specified by the block parameters, the additional arguments are ignored.
-   If you pass too few arguments than otherwise specified by the block parameters, then the additional arguments are assigned a value of `nil`.

#### What is arity?

-   The rules regarding the number of arguments that a block/proc takes.

#### What are some common use cases for blocks?

-   Defer implementation code to a method invocation decision
-   Methods that need to perform some before/after action - **sandwich code**.

#### What are the roles within a method?

-   Method implementor
-   Method caller
-   Both roles can be the same person (often are).

#### How to define an explicit block?

-   Must use the & operator.
-   The & operator will convert a symbol to a Proc, then convert the Proc to a Block.

#### What are the benefits of an explicit block compared to an implicit block?

-   You can assign a name to an explicit block

    ```ruby
    def a_method(name, &:change_name)
      puts name
      name = change_name.call(name)
      puts name
    end

    a_method { ['Bob', 'Rob', 'Kevin'].sample }
    ```


      - Provides additional flexibility
      - Allows you to pass the block to another method. Because the block is now represented as a local variable.

    ### Key Takeaways:
      - Blocks as a way Ruby implements closures.
      - Blocks can take arguments; __Won't complain if the wrong number of arguments are passed to it.__
      - Blocks return a value, just like normal methods.
      - Blocks are a way to defer some implementation decisions to method invocation time. Allows method callers to refine a method at invocation time for a specific use case.
      - Blocks are a good use case for 'sandwich code' scenarios.
