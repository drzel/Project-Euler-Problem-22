# Ruby exercise. Solution to Project Euler Problem 22.
# https://projecteuler.net/problem=22

class NameCalc
  # Return the alphabetical score of a letter. E.g. a = 1, b = 2, c = 3.
  def letter_score(letter)
    letter.upcase.ord - 64
  end

  def initialize(file)
    @names = File.read(file).delete('"').split(',').sort
  end

  def find_value_of(str)
    str.split('').map { |letter| letter_score(letter) }.reduce(:+)
  end

  def find_value_of_all_names
    @names.map.with_index(1) { |name, index| find_value_of(name) * index }.reduce(:+)
  end
end

calc = NameCalc.new('p022_names.txt')
colin = calc.find_value_of('COLIN')
raise "Colin fails with #{colin}" unless colin == 53
puts "The total is #{calc.find_value_of_all_names}"
