require 'yaml'

class Hangman
  def initialize
    content = File.open('5desk.txt', 'r') { |file| file.read } # loads dictionary file
    valid_words = content.split.select { |word| word.length.between?(5,12) }  # filters words 5-12 letters
    @word = valid_words[rand(valid_words.size)].downcase.split('') #selects random word
    @display = Array.new(@word.length, '_')
    @misses = Array.new # tracks guesses that were not in word
    @turns = 6 #turns left before game over
  end

  # simulates one game of hangman
  def play
    result = "Sorry, you lose.  The word was #{@word.join}."
    while @turns > 0
      display # displays number of letters, misses, turns remaining
      guess # prompts user for letters
      if @display.none? { |i| i == '_' }
        result = "#{@display.join('  ')}\nCongrats, you win!"
        @turns = 0
      end
    end
    puts result
  end

  # displays relevant info to user
  def display
    @display.each { |i| print "#{i}  " }
    puts "\n"
    puts "Misses: #{@misses.join(', ')}"
    puts "Turns Remaining: #{@turns}"
  end

  def guess
    print 'Enter guess: '
    input = gets.chomp
    puts "\n"
    if input == 'save'
      save_game
      puts 'Game has been saved.', "\n"
    elsif @word.none? { |w| w == input } # add unfound letter to misses array, reduce turns
      @misses << input
      @turns -= 1
    else
      @word.each_with_index do |letter, i| # add letter to display array
        @display[i] = letter if letter == input
      end
    end
  end
end

def load_game
  # assumes file exists
  content = File.open('games/saved.yaml', 'r') { |file| file.read }
  YAML.load(content) # returns a Hangman object
end

def save_game
  Dir.mkdir('games') unless Dir.exist? 'games'
  filename = 'games/saved.yaml'
  File.open(filename, 'w') do |file|
    file.puts YAML.dump(self)
  end
end

# method used to validate y/n responses form users
def valid_answer(q)
  input = ''
  until input == 'y' || input == 'n'
    print q
    input = gets.chomp
  end
  input
end

# main program loop
puts "\nWELCOME TO HANGMAN\n"
loop do 
  input = valid_answer('Do you want to load previously saved game (y/n)? ')
  puts "Thank you.  You can save game at any moment by typing 'save'."
  game = input == 'y' ? load_game : Hangman.new
  game.play
  input2 = valid_answer('Play another game (y/n)? ')
  break if input2 == 'n'
end
