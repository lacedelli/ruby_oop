require_relative "players.rb"
require_relative "board.rb"
class Game
	attr_reader :board, :pc, :npc

	def initialize()
		# TODO set up players
		pc = Player.new()
		npc = ComputerPlayer.new()
		# Set up board
		@board = Board.new()
		# create variable for guesses
		@guesses = Array.new()
	end

	def play_round(guesses_num)
		# TODO restart variable for guesses
		guesses = []
		# TODO Set up a loop with guesses as a limit
		guesses_num.each do
			# TODO Get a guess from active player
			# TODO Compare guess with current board
			# TODO assign points to each player
			# TODO if guess is correct, end loop
		end
		# TODO if loop ends, end game and assign points
	end

	def play_game()
		# TODO set up a loop
			# TODO play a round
			# TODO print scores, ask if player wants to play another round
			# TODO if player says yes, continue loop
			# TODO Else, break
	end
	
	private 
	attr_writer :board, :pc, :npc
end
