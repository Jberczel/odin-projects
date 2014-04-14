

class Game
	attr_reader :board, :player_1, :player_2, :pos

	def initialize
		@board = Board.new
		@player_1 = Player.new
		@player_2 = Player.new
		@pos = { 1 => [0,0], 2 => [0,1], 3 =>[1,1]}


	end

	def start
		print "Enter name for player 1: "
		@player_1.name = gets.chomp
		@player_1.sym = "X"
		print "Enter name for player 2: "
		@player_2.name = gets.chomp
		@player_2.sym = "O"
		puts "Thank you, #{@player_1.name}, it is your turn."
	end

	def turn(player)
		print "Enter your move: "
		input = gets.chomp.to_i # add chomp
		puts "Thank you, you selected #{input}"
		@board.update( @pos[input][0], @pos[input][1], player.sym)


	end


	Player = Struct.new(:name, :sym)

	class Board
		def initialize
			@sym = "-" # keep track of empty grid cells
			@board = Array.new(3) { Array.new(3, @sym) }
		end

		def print_grid
			puts "\n"
			@board.each do |row|
				row.each { |i| print " #{i} " } 
				puts "\n"		
			end
		end

		def update(row, col, sym)
			@board[row][col] = sym if @board[row][col] == @sym
		end
	end
end


	


my_game = Game.new

my_game.start
my_game.board.print_grid
p my_game.pos[1][1]
my_game.turn(my_game.player_1)

my_game.board.print_grid








