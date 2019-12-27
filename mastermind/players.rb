class Player
	def initialize()
		# TODO there's gotta be stuff to initialize, but I can't think of it rn
	end

	def get_code(spaces)
		guesses = spaces
		code = Array.new
		# Make a loop
		loop do
			# ensure that the input is valid for the game
			puts "Select a color! You've got #{guesses} left"
			puts "The options are: Green, Red, Blue, Yellow"
			color = gets().chomp()
			# If valid, append to the array
			if valid_input?(color)
				code.push(color)
				guesses -= 1
			else
				puts "The input was not valid, please check for typos"
				next
			end
			if guesses == 0
				break
			end
		end
		code
	end

	private

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

end

class ComputerPlayer < Player
	attr_reader :correct_guesses

	def initialize()
		# Initialize array for correct guesses
		@correct_guesses = Array.new()
	end

	def get_code(spaces)
		select = Array.new()
		loop do 
			select.push(create_color())
			if select.length() == spaces
				break
			end
		end
		select
	end

	def make_guess(spaces)
		# get guesses that are correct
		current_guesses = Array.new
		current_guesses = self.correct_guesses unless self.correct_guesses.all?(nil)
		# generate new guesses based off of random numbers
		spaces.times do |i|
			if current_guesses[i] == nil
				current_guesses[i] == self.create_color()
			end
		end
		current_guesses
	end	

	def asses_guess(results)
		# TODO Check if any of the values equals to green and add them
		# TODO to the respective slot on the instance variable for next guesses
	end

	private
	attr_writer :correct_guesses

	def create_color()
		select = String.new()
		rand = Random.new()
		select_int = rand.rand(3)
		case select_int
			when 0
				select = "red"
			when 1
				select = "green"
			when 2
				select = "blue"
			when 3
				select = "yellow"
			end
		puts select
		select
	end
end
