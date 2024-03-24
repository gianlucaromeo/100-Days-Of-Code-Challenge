# In this file:
# - Ruby cool features and tips to work with arrays

# Tip 1 - Use `each` instead of `for` loops
(1..5).each do |i|
  puts i
end

# Tip 2 - Use `map` to transform elements in an array
numbers = [1, 2, 3, 4, 5]
new_numbers = numbers.map { |number| number * 2 }
puts new_numbers.inspect # Output: [2, 4, 6, 8, 10]

# Tip 3 - Use `select` to filter elements in an array
numbers = [1, 2, 3, 4, 5]
even_numbers = numbers.select { |number| number.even? }
puts even_numbers.inspect # Output: [2, 4]

# Tip 4 - Use `reduce` to combine elements in an array
numbers = [1, 2, 3, 4, 5]
sum = numbers.reduce(0) { |acc, number| acc + number }
puts sum # Output: 15

# Tip 5 - Use `sort` to sort elements in an array
numbers = [3, 1, 4, 1, 5]
sorted_numbers = numbers.sort
puts sorted_numbers.inspect # Output: [1, 1, 3, 4, 5]

# Tip 6 - Use `uniq` to remove duplicates from an array. Code example:
numbers = [1, 2, 2, 3, 3, 3]
unique_numbers = numbers.uniq
puts unique_numbers.inspect # Output: [1, 2, 3]

# Tip 7 - Use `zip` to combine two arrays into a single array of pairs. Code example:
letters = ['a', 'b', 'c']
numbers = [1, 2, 3]
pairs = letters.zip(numbers)
puts pairs.inspect # Output: [["a", 1], ["b", 2], ["c", 3]]

# Tip 8 - Use `flatten` to convert a multi-dimensional array into a single-dimensional array. Code example:
matrix = [[1, 2], [3, 4], [5, 6]]
flat_matrix = matrix.flatten
puts flat_matrix.inspect # Output: [1, 2, 3, 4, 5, 6]

# Tip 9 - Use `reverse` to reverse the elements in an array. Code example:
numbers = [1, 2, 3, 4, 5]
reversed_numbers = numbers.reverse
puts reversed_numbers.inspect # Output: [5, 4, 3, 2, 1]

# Tip 10 - Use `sample` to select a random element from an array. Code example:
numbers = [1, 2, 3, 4, 5]
random_number = numbers.sample
puts random_number # Output: 3