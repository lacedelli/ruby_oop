class Board
	def initialize() 
		# Set a variable that holds four values
		@secret_code = Hash.new()
	end

	def create_board(array)
		# TODO Grab the values contained in the array passed to the board
		# TODO and assign them in order to the values in @secret_code 
	end

	def asses_guess(guess)
		# TODO Make an array to push the status of the guesses
		# TODO Compare the guess array with each of the values in @secret_code
		# TODO Send a red signal if the guess is wrong
		# TODO Send a blue signal if the the guess is right, but in the wrong place
		# TODO Send a green signal if the guess is right
		# TODO return signals
	end

	def to_s()
		# TODO Set a procedure that takes the letters of each of the values
		# TODO within @secret_code and changes the colors of each letter
		# TODO depending on the value
	end
	
end
