
class Game
  attr_reader :grid, :player_1, :player_2, :game_status
  @@wins = 
    [[0, 1 ,2], [3, 4, 5], [6, 7, 8], [0, 3, 6], 
     [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] # winning combos

  def initialize
    @grid = Board.new
    @player_1 = Player.new
    @player_2 = Player.new
    @active_game = true
    @turns = 1
  end

  def play
    start
    loop do
      curr_player = @turns.even? ? @player_2 : @player_1
      turn(curr_player)
      @grid.print_grid
      break if @active_game == false
    end
    puts '---------'
    puts 'Game Over'
    puts '---------'
  end

  private

  def start
    puts '------------------------------'
    puts 'Welcome to my TicTacToe Game!!'
    puts '------------------------------'
    print 'Enter player 1 name: '
    @player_1.name = gets.chomp
    @player_1.sym = 'x'
    print 'Enter player 2 name: '
    @player_2.name = gets.chomp
    @player_2.sym = 'o'
    puts "Thank you, #{@player_1.name}, it is your turn."
    @grid.print_grid
  end

  def turn(player)
    loop do
      puts "Turn: #{@turns}"
      print "#{player.name} ('#{player.sym}') "
      input = valid_name  
      if @grid.update(input, player.sym)
        @turns += 1
        check_for_win(player)
        break
      else
        puts 'Sorry, cell already selected.'
      end
    end
  end

  def check_for_win(player)
    @@wins.each do |w|
      if w.all? { |a| @grid.board[a] == player.sym }
        puts "CONGRATS #{player.name}, YOU WON!"
        @active_game = false
      end
    end
    if @turns > 9 && @active_game
      puts "IT'S A TIE."
      @active_game = false
    end
  end

  def valid_name
    input = nil
    until (0..8).include?(input)
      print 'enter your move (1-9) top to bottom, left to right: '
      input = gets.chomp.to_i - 1 # array is indexed 0-8; positions are 1-9
    end
    input
  end

  Player = Struct.new(:name, :sym)

  class Board
    attr_reader :board, :empty_cell
    
    def initialize
      @empty_cell = '-' # default value for empty cells
      @board = Array.new(9, @empty_cell)
    end

    def print_grid # prints 3 X 3 grid with values
      puts "\n"
      @board.each_with_index do |val, i|
        print " #{val} "
        print '|' if (i + 1) % 3 != 0
        puts "\n" if (i + 1)  % 3 == 0
      end
      puts "\n"
    end

    def update(pos, sym)
      if @board[pos] == @empty_cell
        @board[pos] = sym
        return true
      else
        return false
      end
    end
  end
end

my_game1 = Game.new
my_game1.play


