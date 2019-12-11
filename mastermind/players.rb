class Player
	def initialize()
		# TODO there's gotta be stuff to initialize, but I can't think of it rn
	end

	def get_code(spaces)
		guesses = spaces.length()
		code = Array.new
		# Make a loop
		loop do
			# ensure that the input is valid for the game
			puts "Make your guess! You've got #{guesses} left"
			puts "The options are: Green, Red, Blue, Yellow"
			color = gets().chomp()
			# If valid, append to the array
			if self.valid_input?(color)
				code.push(color)
			else
				puts "The input was not valid, please check for typos"
				guesses -= 1
				next
			end
			if guesses == code.length()
				break
			end
		end
		code
	end

	def valid_input?(input)
		color = input
		case color.downcase
		when "red"
			return true
		when "blue"
			return true
		when "yellow"
			return true
		when "green"
			return true
		else
			return false
		end
	end

	def make_guess(spaces)
		board_spaces = spaces
		guesses = Array.new()
		loop do
			puts "Make your guess! you have #{board_spaces - guesses.length()} left!"
			puts "Your options are red, green, blue and yellow."
			guess = gets().chomp()
			if self.valid_guess?(guess)
				guesses.push(guess)
			else
				puts "I could not understand the text, please check for typos"
				next
			end
			if guesses.length() == board_spaces
				break
			end
		end
		guesses
	end

end

class ComputerPlayer > Player

	def initialize()
		# TODO initialize array for correct guesses
		@correct_guesses = Array.new()
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
