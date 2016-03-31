text = File.read "p022_names.txt"
ary = text.gsub!('"','').split(",").sort

def alphabetical_score(letter)
  ("a".."z").to_a.index(letter) + 1
end

def score_word(word)
  word.split("").inject(0) do |sum, letter|
    sum + alphabetical_score(letter)
  end
end
