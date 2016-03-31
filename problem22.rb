text = File.read "p022_names.txt"
ary = text.gsub!('"','').split(",").sort
