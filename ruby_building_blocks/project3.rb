def substring(text, dict)
  text.downcase!
  counter = {}
  dict.each do |word|
    counts = text.scan(word).length
    counter[word] = counts unless counts < 1
  end
  counter
end
