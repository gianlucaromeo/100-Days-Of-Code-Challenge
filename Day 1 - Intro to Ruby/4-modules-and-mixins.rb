# In this file:
# - Modules
# - Mixins
# - Namespacing

# - Modules are a way to group together methods, classes, and constants
# - They are defined with the "module" keyword
# - They are used to organize code and avoid naming conflicts
# - They cannot be instantiated
# - They can be included in classes
module Greetings
    def greet
        puts "Hello"
    end
end

class Person
    include Greetings
end

person = Person.new
person.greet

# - Mixins are a way to add functionality to a class
# - They are defined with modules
# - They are included in classes with the "include" keyword
# - They allow classes to share behavior without inheritance
# - They are used to avoid code duplication
module Greetings
    def greet
        puts "Hello"
    end
end

module Farewells
    def farewell
        puts "Goodbye"
    end
end

class Person
    include Greetings
    include Farewells
end

person = Person.new
person.greet
person.farewell

# - Namespacing is a way to organize code by grouping related classes, modules, and constants
# - It is done by using the "module" keyword
# - It is used to avoid naming conflicts
module Animals
    class Dog
        def bark
            puts "Woof"
        end
    end

    class Cat
        def meow
            puts "Meow"
        end
    end
end

# - Modules can be nested to create a hierarchy
# - They can be accessed with the "::" operator
# - They can be used to organize code in a logical way
dog = Animals::Dog.new
dog.bark
cat = Animals::Cat.new
cat.meow
