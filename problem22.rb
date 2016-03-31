text = File.read "p022_names.txt"
ary = text.gsub!('"','').split(",").sort

def alphabetical_score(letter)
  ("a".."z").to_a.index(letter).to_i + 1
end

def score_word(word)
  word.split("").inject(0) do |sum, letter|
    sum + alphabetical_score(letter)
  end
end

sum = 0
ary.each_with_index do |word, index|
  sum += score_word(word) * (index + 1)
end
p sum
