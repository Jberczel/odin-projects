# takes a word as the first argument and then an array of valid substrings (your dictionary)
# as the second argument. It should return a hash listing each substring (case insensitive)
# that was found in the original string and how many times it was found.
def substring(text, dict)
  text.downcase!
  counter = {}
  dict.each do |word|
    counts = text.scan(word).length
    counter[word] = counts unless counts < 1
  end
  counter
end
