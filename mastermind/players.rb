class Player
	def initialize()
		# Apparently there's no need to initialize anything here, turns out people
		# Can just use their brains to hold variables.
	end

	def get_code(spaces)
		guesses = spaces
		code = Array.new
		# Make a loop
		loop do
			# ensure that the input is valid for the game
			puts "\nSelect a color! You've got #{guesses} left"
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

	def make_guess(spaces)
		guesses = self.get_code(spaces)
		guesses.map! do |guess|
			case guess.downcase()
			when "red", "r"
				guess = "R"
			when "green", "g"
				guess = "G"
			when "blue", "b"
				guess = "B"
			when "yellow", "y"
				guess = "Y"
			end
		end
		guesses
	end

	private

	def valid_input?(input)
		color = input
		case color.downcase
		when "red", "r"
			return true
		when "blue", "b"
			return true
		when "yellow", "y"
			return true
		when "green", "g"
			return true
		else
			return false
		end
	end

end

class ComputerPlayer < Player
	attr_reader :correct_guesses, :current_guesses, :blue_guesses

	def initialize()
		# Initialize array for correct guesses
		@correct_guesses = Array.new()
		@current_guesses = Array.new()
		@blue_guesses = Array.new()
	end

	def get_code(spaces)
		select = Array.new()
		loop do 
			select.push(create_color())
			if select.length() == spaces
				break
			end
		end
		reset_arrays()
		create_blue_guesses(spaces)
		select
	end

	def make_guess(spaces)
		# get guesses that are correct
		current_guesses = Array.new(spaces)
		current_guesses = self.correct_guesses unless self.correct_guesses.all?(nil)
		# generate new guesses based off of random numbers
		spaces.times do |i|
			if current_guesses[i] == nil
				current_guesses[i] = color_to_letter(create_color())
				while self.blue_guesses[i].any?(current_guesses[i])
					current_guesses[i] = color_to_letter(create_color())
				end
			end
		end
		self.current_guesses = current_guesses
		current_guesses
	end	

	def assess_guess(results)
		# Check if any of the values equals to green and add them
		# to the respective slot on the instance variable for next guesses
		results.each_index do |i|
			if results[i] == "G"
				puts "results[i] == G true"
				puts "current_guesses[i] == #{current_guesses[i]}"
			elsif results[i] == "B"
				puts "results[i] == B true"
			elsif results[i] == "R"
				puts "results[i] == R true"
			end
		end
	end


	private
	attr_writer :correct_guesses, :current_guesses, :blue_guesses
	
	def create_blue_guesses(spaces)
		spaces.times do |i|
			self.blue_guesses[i] = Array.new()
		end
	end

	def create_color()
		select = String.new()
		rand = Random.new()
		select_int = rand.rand(4)
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
		select
	end

	def color_to_letter(color)
		guess = String.new()
		case color
		when "red"
			guess = "R"
		when "green"
			guess = "G"
		when "blue"
			guess = "B"
		when "yellow"
			guess = "Y"
		end
		guess
	end
	
	def reset_arrays()
		@correct_guesses = Array.new()
		@current_guesses = Array.new()
		@blue_guesses = Array.new()
	end

end
