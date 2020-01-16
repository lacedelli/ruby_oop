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

	def make_guess(spaces)
		guesses = self.get_code(spaces)
		guesses.map! do |guess|
			case guess.downcase()
			when "red"
				guess = "R"
			when "green"
				guess = "G"
			when "blue"
				guess = "B"
			when "yellow"
				guess = "Y"
			end
		end
		guesses
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
		create_blue_guesses(spaces)
		select
	end

	def make_guess(spaces)
		puts "inside make_guess"
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
		puts "self.current_guesses"
		p self.current_guesses
		current_guesses
	end	

	def assess_guess(results)
		puts "inside_assess guess"
		# Check if any of the values equals to green and add them
		# to the respective slot on the instance variable for next guesses
		results.each_index do |i|
			if results[i] == "G"
				self.correct_guesses[i] = self.current_guesses[i]
			elsif results[i] == "B"
				# TODO Add current guess to the class' blue guess array at current index
				self.blue_guesses[i].push(self.current_guesses[i])
				# TODO Search a non-green guess
				results.each_index do |i|
					unless results[i] == "G"
					# TODO If guess does not have current color at @blue_guesses index
						unless self.blue_guesses[i].any?(current_guesses[i])
							self.blue_guesses[i].push(current_guesses[i])
					# TODO add it to @correct_guesses
							self.correct_guesses[i] == current_guesses[i]
							break
						end
					end
				end
				# TODO if @correct_guesses has current guess at current index
				if self.correct_guesses[i] == self.current_guesses[i]
					self.correct_guesses[i] = nil
				end
			elsif results[i] == "R"
			end
		end
		puts "current_guesses"
		p self.current_guesses
		puts "correct_guesses"
		p self.correct_guesses
		puts "blue_guesses"
		p self.blue_guesses
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
end
