# In this file:
# - Reading from files
# - Writing to files
# - Appending to files
# - Reading entire files


# Reading lines of file (1)
file = File.open("example.txt", "r")
file.each_line do |line|
    puts line
end

# Reading lines of file (2)
File.open("example.txt", "r") do |file|
    file.each_line do |line|
        puts line
    end
end


# Write to file --> "w"
File.open("example.txt", "w") do |file|
    file.puts "Hello, world!"
    file.puts "Another line"
end


# Append to file --> "a"
File.open("example.txt", "a") do |file|
    file.puts "Appending to file"
end


# Reading entire file
contents = File.read("example.txt")
puts contents
