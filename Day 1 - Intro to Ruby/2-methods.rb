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
v1, v2 = method_with_multiple_return_values

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