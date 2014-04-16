
class Hangman

  def initialize
    file = File.open("5desk.txt", "r")
    contents = file.read
    valid_words = contents.split.select { |word| word.length.between?(5,12) }   
    @word = valid_words[rand(valid_words.size)].downcase.split('')
    @display = Array.new(@word.length, '_')
    @guesses = Array.new
    @misses = Array.new
    @turns = 6
  end

  def play
    puts "\nWELCOME TO HANGMAN\n"
    result = "Sorry, you lose.  The word was #{@word.join}."
    while @turns > 0
      display
      guess
      if @display.none? { |i| i == '_' }
        result = "#{@display.join(' ')}\nYou win!"
        @turns = 0
      end  
    end
    puts result
  end
  
  def display
    #puts @word.join
    @display.each { |i| print "#{i}  "}
    puts "\n"
    puts "Misses: #{@misses.join(' ')}"
    puts "Turns Remaining: #{@turns}"
  end

  def guess
    print "Enter guess: "
    input = gets.chomp
    puts "\n"
    if @word.none? { |w| w == input }
      @misses << input
      @turns -= 1
    else
      @word.each_with_index do |letter, i|
        @display[i] = letter if letter == input
      end
    end
  end

end

game = Hangman.new
game.play

