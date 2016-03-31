# Ruby exercise. Solution to Project Euler Problem 22.
# https://projecteuler.net/problem=22

class NameCalc
  # Return the alphabetical score of a letter. E.g. a = 1, b = 2, c = 3.
  def letter_score(letter)
    ('A'..'Z').to_a.index(letter.upcase).to_i + 1
  end

  # Return the aphabetical score of a string. E.g. 'abc' = 1 + 2 + 3 = 6.
  def word_score(word)
    word.split('').inject(0) do |sum, letter|
      sum + letter_score(letter)
    end
  end

  def initialize(file)
    # Create a sorted array of names from text file by removing delimiters.
    @names = File.read(file).delete('"').split(',').sort
  end

  # Return total score by finding the sum of each word's score multiplied by
  # its position in the list.
  def score
    total_score = 0
    @names.each_with_index do |name, index|
      word_position = index + 1
      name_score = word_score(name) * word_position
      total_score += name_score
    end
    total_score
  end
end

calc = NameCalc.new('p022_names.txt')
p calc.score
