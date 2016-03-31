text = File.read "p022_names.txt"
ary = text.gsub!('"','').split(",").sort

def alphabetical_score(letter)
  ("A".."Z").to_a.index(letter).to_i + 1
end

def score_word(word)
  word.split("").inject(0) do |sum, letter|
    sum + alphabetical_score(letter)
  end
end

sum = 0
ary.each_with_index do |word, index|
  word_position = index + 1
  name_score = score_word(word) * word_position
  sum += name_score
end
p sum
