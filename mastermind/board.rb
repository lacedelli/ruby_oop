class Board
	def initialize() 
		attr_reader :secret_code
		# Set a variable that holds four values
		@secret_code = Array.new()
	end

	def create_board(array)
		# Grab the values contained in the array passed to the board
		# and assign them in order to the values in @secret_code 
		values = array

		values.each_index do |v, i|
			case i.downcase
			when "red"
				self.secret_code[i] = "R"
			when "blue"
				self.secret_code[i] = "B"
			when "yellow"
				self.secret_code[i] = "Y"
			when "green"
				self.secret_code[i] = "G"
			end
		end
	end

	def asses_guess(guess)
		# Make an array to push the status of the guesses
		correct_guesses = Array.new
		# Make an array that we can pop values from
		local_code = self.secret_code
		# Compare the guess array with each of the values in @secret_code
		local_code.each_index do |v, i|
		# Send a green signal if the guess is right
			if guess[i] == v
				correct_guesses.push("G")
				local_code[i] = nil
		# Send a blue signal if the the guess is right, but in the wrong place
			elsif local_code.include?(guess[i])
				correct_guesses.push("B")
				local_code[i] = nil
			else
				correct_guesses.push("R")
				local_code[i] = nil
		end
		correct_guesses	
	end

	def to_s()
		# TODO Set a procedure that takes the letters of each of the values
		# TODO within @secret_code and changes the colors of each letter
		# TODO depending on the value
	end

	def colorize(string)
	end
	
	private
	attr_writer :secret_code
end

