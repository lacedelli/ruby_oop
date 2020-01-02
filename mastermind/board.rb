class Board
	NC = "\033[0m"
	RED = "\033[0;31m"
	GREEN = "\033[0;32m"
	BLUE = "\033[0;34m"
	YELLOW = "\033[1;33m"
	attr_reader :secret_code

	def initialize() 
		# Set a variable that holds four values
		@secret_code = Array.new()
	end

	def create_board(array)
		# Grab the values contained in the array passed to the board
		# and assign them in order to the values in @secret_code 
		values = array
		puts "#{values}"
		values.each_index do |i|
			case values[i].downcase
			when "red", "r"
				self.secret_code[i] = "R"
			when "blue", "b"
				self.secret_code[i] = "B"
			when "yellow", "y"
				self.secret_code[i] = "Y"
			when "green", "y"
				self.secret_code[i] = "G"
			end
		end
		nil
	end

	def assess_guess(guess, colorize = false)
		# Make an array to push the status of the guesses
		correct_guesses = Array.new
		# Make an array that we can pop values from
		local_code = self.secret_code
		# Compare the guess array with each of the values in @secret_code
		local_code.each_index do |i|
		# Send a green signal if the guess is right
			if guess[i] == local_code[i]
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
		end
		# If colorize is false, return an unadulterated string
		if colorize
			correct_guesses.map do |g|
				colorize(g)
			end
		end
		correct_guesses
	end

	def all_guesses_correct?(guess)
		state = false
		results = self.assess_guess(guess)
		if results.all?("g")
			state = true
		end
		state
	end

	def to_s()
		status_string = String.new()
		self.secret_code.each do |i|
			status_string += "#{colorize(i)}, "
		end
		status_string.strip().chop()
	end

		
	private
	attr_writer :secret_code

	def colorize(string)
		# Return a colorized version if a color is not included
		case string
		when "R"
			return "#{RED}R#{NC}"
		when "G"
			return "#{GREEN}G#{NC}"
		when "B"
			return "#{BLUE}B#{NC}"
		when "Y"
			return "#{YELLOW}Y#{NC}"
		end
	end

end
