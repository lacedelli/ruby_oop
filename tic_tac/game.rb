require_relative 'board.rb'

class Game
	attr_accessor :p1_rounds, :p2_rounds, :board

	def initialize()
		# set up the round counter for each player
		@p1_rounds = 0
		@p2_rounds = 0
		# Load the board class
		@board = Board.new()

	end
	# Override to_s to print the board.
	def to_s()
		p_board()
	end

	private
	# The helper method that prints the board
	def p_board
		"#{board.top[:left]}|#{board.top[:center]}|#{board.top[:left]}\n"\
		 "——————\n"\
		 "#{board.middle[:left]}|#{board.middle[:center]}|#{board.middle[:left]}\n"\
		 "——————\n"\
		 "#{board.bottom[:left]}|#{board.bottom[:center]}|#{board.bottom[:left]}\n"
	end

end

game = Game.new()
puts game.to_s
