# In this file:
# - Methods
# - Blocks
# - Procs
# - Lambdas

# Empty method
def empty_method
end

# Method with parameters
def method_with_parameters(name, age)
    puts "My name is #{name} and I am #{age} years old"
end

# Method with default parameters
def method_with_default_parameters(name = "User")
    puts "Hello, #{name}"
end

# Method with splat operator
def method_with_splat_operator(*args)
    puts args
end

# Method with keyword arguments
def method_with_keyword_arguments(name:, age:)
    puts "My name is #{name} and I am #{age} years old"
end

# Method with return value
def method_with_return_value
    return "Hello"
end

# Method with multiple return values
def method_with_multiple_return_values
    return 1, 2
end

# Method with implicit return
def method_with_implicit_return
    "Hello"
end

# Method with optional block
def method_with_optional_block
    puts "Start"

    # - "yield" transfers control from the method to the block
    #   and any arg passed to the method can be passed to the block.
    # 
    # - "if block_given?" checks if the method was called with a 
    #   block or not
    yield if block_given?

    puts "End"
end

method_with_optional_block do
    puts "Inside Block"
end

# Procs
# - Procs are blocks that are wrapped in a Proc object
# - They can be stored in variables and passed around
# - They can be called with the "call" method
# - The difference between Procs and blocks is that Procs 
#   can be called outside the method where they were defined
my_proc = Proc.new { puts "Hello from Proc" }
my_proc.call

# Lambdas
# - Lambdas are similar to Procs but with some differences
# - They enforce the number of arguments passed to them
# - They return control to the calling method
my_lambda = -> { puts "Hello from Lambda" }
my_lambda.call

# Methods can be called with or without parentheses
method_with_parameters "Gianluca", 24
method_with_parameters("Gianluca", 24)

method_with_default_parameters
method_with_default_parameters "Gianluca"

method_with_splat_operator 1, 2, 3, 4

method_with_keyword_arguments name: "Gianluca", age: 24

v1, v2 = method_with_multiple_return_values

puts method_with_return_value

puts v1
puts v2

puts method_with_implicit_return