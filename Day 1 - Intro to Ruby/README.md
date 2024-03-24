# Day 1 - Intro to Ruby

✔️ Setup my `100-Days-Of-Code-Challenge` repository
<br>
✔️ Setup [my X account](https://twitter.com/__gianluc4) and [my Thread account](https://www.threads.net/__gianluc4)
<br>
✔️ Explore Ruby
<br>
✔️ Commit common Ruby features

# Table of contents
1. [What is Ruby?](#1-what-is-ruby)
2. [Syntax and features of Ruby](#2-syntax-and-features-of-ruby)

## 1. What is Ruby
Ruby is a high-level, interpreted programming language that was designed and developed by Yukihiro "Matz" Matsumoto in the mid-1990s. It is a dynamic, open source language with a focus on simplicity and productivity. Ruby has an elegant syntax that is natural to read and easy to write. It supports multiple programming paradigms, including procedural, object-oriented, and functional programming. Ruby is also known for its use in web development, particularly with the Ruby on Rails framework.

Here's a short Ruby code snippet.

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
In this repository, you can find the following topics:
1. `1-syntax-basics-and-control-structures.rb` Syntax Basics and Control Structures
2. `2-methods-procs-blocks.rb` Methods, Blocks, Procs
3. `3-classes.rb` Classes and Objects
4. `4-modules-and-mixins.rb` Modules and Mixins
5. `5-exceptions-handling.rb` Exceptions Handling
6. `6-files.rb` Files I/O 
7. `7-regex.rb` Regular Expressions
8. `8-arrays-cool-features` Cool features to work with arrays
