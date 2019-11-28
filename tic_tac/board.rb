class Board
	attr_reader :top, :middle, :bottom
	def initialize()
		# Set up the board, each row assigned to a different variable
		@top = {:right => " ",
						:center => " ",
						:left => " "}
		@middle = {:right => " ",
						   :center => " ",
							 :left => " "}
		@bottom = {:right => " ",
						   :center => " ",
							 :left => " "}
	end

	# Set a value to the selected cel	
	def valid_move?(row, column)
		# Check if the cell is empty, return boolean for loop purposes
		cel = self.instance_variable_get("@#{row}")[column.to_sym]
		if cel == " "
			return true
		else
			puts "The selected cell already has the character #{cel} on it."
			return false
		end
	end

	def set_value(row, column, char)
		self.instance_variable_get("@#{row}")[column.to_sym] = char
	end

	# Check if any of the lines is complete
	def line_complete?(char)
		char = char
		#Check each row
		if self.top[:left] == char && 
			 self.top[:center] == char && 
			 self.top[:right] == char
			return true
		elsif self.middle[:left] == char &&
					self.middle[:center] == char &&
					self.middle[:right] == char
			return true
		elsif self.bottom[:left] == char &&
					self.bottom[:center] == char &&
					self.bottom[:right] == char
			return true
		#Check each column
		elsif self.top[:left] == char &&
					self.middle[:left] == char &&
					self.bottom[:left] == char
			return true
		elsif self.top[:center] == char &&
					self.middle[:center] == char &&
					self.bottom[:center] == char
			return true
		elsif self.top[:right] == char &&
					self.middle[:right] == char &&
					self.bottom[:right] == char
			return true
		#Chect diagonal rows
		elsif self.top[:left] == char &&
					self.middle[:center] == char &&
					self.bottom[:right] == char
			return true
		elsif self.top[:right] == char &&
					self.middle[:center] == char &&
					self.bottom[:left] == char
			return true
		else
			return false
		end
	end

	# Parse the text that the player might input
	def understands?(row, column)
		# Turn strings into symbols
		row = row.downcase.to_sym
		column = column.downcase.to_sym
		read = Array.new
		# Check the cases for rows
		case row
		when :top
			read[0] = true
		when :middle 
			read[0] = true
		when :bottom
			read[0] = true
		else
			read[0] = false
		end
		# Check cases for columns
		case column
		when :left
			read[1] = true
		when :center
			read[1] = true
		when :right
			read[1] = true
		else
			read[1] = false
		end
		read
	end

	# Override to_s to make it easier to print
	def to_s() 
		"|#{@top[:left]}|#{@top[:center]}|#{@top[:right]}|\n"\
		"|—————|\n"\
		"|#{@middle[:left]}|#{@middle[:center]}|#{@middle[:right]}|\n"\
		"|—————|\n"\
		"|#{@bottom[:left]}|#{@bottom[:center]}|#{@bottom[:right]}|\n"
	end
	
	# TODO Method that loops on itself, and asks the player a move,
	# TODO will only exit the method once the output is valid.
	def get_move()
		# TODO set up an array of booleans
		# TODO start a loop that can only be broken out of
		# TODO ask for input
		# TODO if [false, false], tell player the system cannot parse text, restart
		# TODO if [true, false], tell the player it's an invalid move, restart loop
		# TODO if [true, true] break out of the loop
		# TODO return move
	end

	#TODO Method that checks for stalemate
	def stalemate?
		#TODO make an array of booleans for each row
		#TODO ternary operator for each row that checks if it contains a " "
		#TODO sets a value of array to false for each cleared row
		#TODO if all values are false, return true
		#TODO else, return false
	end

	private
	# Set up the writers as private methods
	attr_writer :top, :middle, :bottom
end
