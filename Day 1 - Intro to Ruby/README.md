# Day 1 - Intro to Ruby

On day 1, I explored Ruby using the official guide, Gemini, and GitHub Copilot.

# Table of contents
1. What is Ruby?
2. Syntax and features of Ruby

## 1. What is Ruby?
Ruby is a high-level, interpreted programming language that was designed and developed by Yukihiro "Matz" Matsumoto in the mid-1990s. It is a dynamic, open source language with a focus on simplicity and productivity. Ruby has an elegant syntax that is natural to read and easy to write. It supports multiple programming paradigms, including procedural, object-oriented, and functional programming. Ruby is also known for its use in web development, particularly with the Ruby on Rails framework.

Here's a short Ruby code snippet that demonstrates several features of the language, including its expressive syntax, support for object-oriented programming, and use of blocks.

```
# Define a class with an initializer, attribute accessor, and a method
class Greeting
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def say_hello
    "Hello, #{@name}!"
  end
end

# Create an instance of the class
greeting = Greeting.new('World')

# Call a method on the instance
puts greeting.say_hello  # Outputs: Hello, World!

# Use an array method with a block
numbers = [1, 2, 3, 4, 5]
squares = numbers.map { |number| number ** 2 }
puts squares  # Outputs: [1, 4, 9, 16, 25]
```

## 2. Syntax and features of Ruby
1. Syntax Basics and Control Structures
2. Methods, Blocks, Procs
3. Classes and Objects
4. Modules and Mixins
5. Exceptions Handling
6. File I/O
7. Regular Expressions
8. Cool features to work with arrays