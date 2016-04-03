# Ruby exercise. Solution to Project Euler Problem 22.
# https://projecteuler.net/problem=22

class NameCalc
  # Find alphabetical value of name
  def find_value_of(str)
    str.split('').map { |letter| letter.upcase.ord - 64 }.reduce(:+)
  end

  def initialize(file)
    @names = File.read(file).delete('"').split(',').sort
  end

  def find_value_of_all_names
    @names.map.with_index(1) { |name, index| find_value_of(name) * index }.reduce(:+)
  end
end

calc = NameCalc.new('p022_names.txt')
colin = calc.find_value_of('COLIN')
raise "Colin fails with #{colin}" unless colin == 53
puts "The total is #{calc.find_value_of_all_names}"
