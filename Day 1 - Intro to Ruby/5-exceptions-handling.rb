# In this file:
# - Raising and handling exceptions
# - begin, rescue, ensure, retry keywords
# - Custom exceptions


begin
    # - Exceptions are raised with the "raise" keyword
    raise "An error occurred"
rescue
    # - Exceptions are caught with the "rescue" keyword
    puts "Rescued the exception"
end


# - Exceptions can have a message
begin
    raise "An error occurred"
rescue => e
    puts e.message  # Output: An error occurred
end


# - Exceptions can be of a specific type
begin
    raise ZeroDivisionError, "Cannot divide by zero"
rescue ZeroDivisionError => e
    puts e.message  # Output: Cannot divide by zero
end


# - Custom exceptions can be defined by subclassing the Exception class
class CustomError < StandardError
end

begin
    raise CustomError, "A custom error occurred"
rescue CustomError => e
    puts e.message
end


# - The "ensure" keyword is used to define code that will always run
begin
    raise "An error occurred"
rescue
    puts "Rescued the exception"
ensure
    puts "Ensuring the code runs"
end


# - The "retry" keyword is used to re-run the code block
begin
    raise "An error occurred"
rescue
    puts "Rescued the exception"
    retry  # This will re-run the code block
end


# - The "raise" keyword is used to raise an exception
begin
    raise "An error occurred"
rescue
    puts "Rescued the exception"
    raise "Another error occurred"
end

