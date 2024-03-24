# In this file:
# - Classes
# - Constructor
# - Instance methods
# - Instance variables
# - Accessors
# - Objects
# - Inheritance
# - Super keyword
# - Overriding methods

class Person
    # - Instance variables are prefixed with "@"
    # - They are accessible from any instance method
    # - They are not accessible from outside the class

    # - Accessors are methods that allow you to read and write instance variables
    # - They are defined with the "attr_accessor" method
    # - They are used to expose instance variables to the outside world
    attr_accessor :name, :age  # This autamaically creates getter and setter methods for name and age

    # - The constructor is defined with the "initialize" method
    def initialize(name, age)
        @name = name
        @age = age
    end

    def display_info
        puts "My name is #{@name} and I am #{@age} years old"
    end
end

person = Person.new("Gianluca", 24)
person.display_info


# - Classes can inherit from other classes
# - The "super" keyword is used to call the parent class constructor
class Employee < Person
    attr_accessor :position

    def initialize(name, age, position)
        super(name, age)
        @position = position
    end

    # - Methods can be overridden by defining a method with the same name
    def display_info
        puts "My name is #{@name}, I am #{@age} years old and I am a #{@position}"
    end
end

employee = Employee.new("Gianluca", 24, "Software Engineer")
employee.display_info
employee.name = "John"
employee.display_info  # This will display the updated name
employee.age = 30
employee.display_info # This will display the updated age
employee.position = "Senior Software Engineer"
employee.display_info # This will display the updated position