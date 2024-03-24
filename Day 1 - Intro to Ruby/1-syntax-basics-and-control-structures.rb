# In this file:
# - Variables (local, global, instance, class)
# - Constants
# - Symbols
# - Data types
# - Range
# - Conditional statements

# Local variables
# 
# - Underscore is a convention to indicate that 
#   the variable is private. However, it is not.
name = "Gianluca"
age = 24
_favorite_number = 4


# Global variables
$global_variable = "I am a global variable"


# Class variables
@@class_variable = "I am a class variable"


# Instance variables
@instance_variable = "I am an instance variable"


# Constants
PI = 3.14159265359


# Symbols
# - Symbols are immutable and unique strings that are used as identifiers
# - They are created by using a colon followed by a word
:my_symbol


# Data types
an_integer = 1
a_float = 1.0
another_float = 1,0
a_string = "I am a string"
another_string = 'I am a string too'
a_boolean = true
another_boolean = false
an_array = [1, 2, 3]
a_hash = { name: "Gianluca", age: 24 }
a_nil = nil


# Range
# - A range is a sequence of values between a start and an end
# - It can be inclusive or exclusive
inclusive_range = 1..5
exclusive_range = 1...5


# Conditional statements
# - if, elsif, else
# - unless
# - case
# - ternary operator
if age >= 18
  puts "You are an adult"
elsif age > 12
  puts "You are a teenager"
else
  puts "You are a child"
end

unless age >= 18
  puts "You are not an adult"
end

case age
when 0..12
  puts "You are a child"
when 13..18
  puts "You are a teenager"
else
  puts "You are an adult"
end

puts age >= 18 ? "You are an adult" : "You are not an adult"