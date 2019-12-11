require_relative "board.rb"
class Game
	def initialize()
		# TODO set up players
		# Set up board
		@board = Board.new()
		# create variable for guesses
		@guesses = Array.new()
	end

	def play_round()
		# TODO restart variable for guesses
		# TODO Set up a loop with guesses as a limit
			# TODO Get a guess from active player
			# TODO Compare guess with current board
			# TODO assign points to each player
			# TODO if guess is correct, end loop
		# TODO if loop ends, end game and assign points
	end

	def play_game()
		# TODO set up a loop
			# TODO play a round
			# TODO print scores, ask if player wants to play another round
			# TODO if player says yes, continue loop
			# TODO Else, break
	end
end
