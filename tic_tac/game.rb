require_relative 'board.rb'

class Game
	attr_accessor :p1_rounds, :p2_rounds, :board

	def initialize()
		# set up the round counter for each player
		@p1_rounds = 0
		@p2_rounds = 0
		# Player turn to be decided with modulo op.
		@player_turn = 0
		# Instatiate board
		@board = Board.new()

	end
	# Override to_s to print the board.
	def to_s()
		@board.to_s
	end
	# Method that plays a round of the game
	def play_round()
		# TODO Figure out which player moves and assign character depending on that
		# TODO Ask the player for a move
		# TODO Check if the move is valid by confirming it is an empty space
		# TODO Make the move
		# TODO add to player counter, changing turn
	end
	def self.play_game()
		#TODO print a message welcoming players
		#TODO start a loop 
		#TODO play a round
		#TODO check for win condition
		#TODO check for stalemate
		#TODO end loop if win or stalemate
		#TODO increment winner's score
		#TODO ask if players want another go
		#TODO set to true if yes
		#TODO print scores and let program end if not
	end	
	private
	attr_accessor :player_turn
end

game = Game.new()
puts game.to_s
