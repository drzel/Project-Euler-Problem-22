text = File.read "p022_names.txt"
ary = text.gsub!('"','').split(",").sort

def alphabetical_score(letter)
  ("a".."z").to_a.index(letter) + 1
end
