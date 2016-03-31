# Ruby exercise. Solution to Project Euler Problem 22.
# https://projecteuler.net/problem=22

# Return the alphabetical score of a letter. E.g. a = 1, b = 2, c = 3.
def alphabetical_score(letter)
  ('A'..'Z').to_a.index(letter.upcase).to_i + 1
end

# Return the aphabetical score of a string. E.g. 'abc' = 1 + 2 + 3 = 6.
def score_word(word)
  word.split('').inject(0) do |sum, letter|
    sum + alphabetical_score(letter)
  end
end

# Create a sorted array of names from text file by removing delimiters.
ary = File.read('p022_names.txt').delete!('"').split(',').sort

# Calculate total score by finding the sum of each word's score multiplied by
# its position in the list.
total_score = 0
ary.each_with_index do |word, index|
  word_position = index + 1
  name_score = score_word(word) * word_position
  total_score += name_score
end

p total_score
