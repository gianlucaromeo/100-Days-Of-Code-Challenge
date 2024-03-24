# In this file:
# - Regular expressions


# - `match`: Returns the first match of a regular expression in a string.
# - `scan`: Returns an array of all matches of a regular expression in a string.
# - `gsub`: Replaces all matches of a regular expression in a string with a specified replacement.
# - `sub`: Replaces the first match of a regular expression in a string with a specified replacement.


# Match a word in a string
string = "hello world"
match = string.match(/hello/)
puts match[0] # Output: hello

# Extract all words in a string
string = "hello world"
words = string.scan(/\w+/)  # returns an array of all words in the string
puts words.inspect # Output: ["hello", "world"]

# Replace a word in a string
string = "hello world"
new_string = string.gsub(/world/, "Ruby")
puts new_string # Output: hello Ruby