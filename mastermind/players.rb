class Player
	def initialize()
		# TODO there's gotta be stuff to initialize, but I can't think of it rn
	end

	def get_code(spaces)
		# TODO Make a loop 
			# TODO ensure that the input is valid for the game
			# TODO If valid, append to the array
			# TODO if not tell the player so and repeat loop
		# TODO End loop if guesses == spaces on board
	end

	def valid_input?(input)
		# TODO Start a switch case for input
		# TODO Make a case for each of the valid inputs, return true
		# TODO Make a case for the rest of the invalid inputs, return false
	end

	def make_guess(spaces)
		# TODO set up a loop
			# TODO ensure that the input is valid
			# TODO if valid, append to array
			# TODO else, tell the player so and repeat loop
		# TODO End loop if guesses == spaces on board
	end

end

class ComputerPlayer > Player

	def initialize()
		# TODO initialize array for correct guesses
	end

	def get_code(spaces)
		# TODO start loop
			# TODO generate a random number
			# TODO Assign a color value to the number and append to array
		# TODO stop generating values when values.length == spaces
		# TODO return values
	end

	def make_guess(spaces)
		# TODO 
	end	

end
