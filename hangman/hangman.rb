
file = File.open("5desk.txt", "r")
contents = file.read

valid_words = contents.split.select { |word| word.length.between?(5,12) } 



word = valid_words[rand(valid_words.size)].downcase.split('')


display = Array.new(word.length, '-')
guesses = Array.new
misses = Array.new


p word
display.each { |i| print "#{i}  "}


 
  puts "\n"
  puts "Misses: #{misses}"
  puts "Turns Remaining: "
  print "Enter guess: "
  input = gets.chomp
  if word.none? { |w| w == input }
    misses << input
  else
    word.each_with_index do |letter, i|
      display[i] = letter if letter == input
    end
  end



p display




