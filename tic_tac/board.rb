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
	def set_value
		#TODO check if selected cel is valid
		#TODO access cel with new value
		#TODO return true
		#TODO if cel is not valid
		#TODO print message telling the user so
		#TODO return false
	end
	# Check if any of the lines is complete
	def line_complete?(char)
		#TODO	define a character to check
		#TODO Check each row
		#TODO Check each column
		#TODO Chect diagonal rows
	end
	# Override to_s to make it easier to print
	def to_s() 
		"|#{@top[:left]}|#{@top[:center]}|#{@top[:right]}|\n"\
		"|—————|\n"\
		"|#{@middle[:left]}|#{@middle[:center]}|#{@middle[:right]}|\n"\
		"|—————|\n"\
		"|#{@bottom[:left]}|#{@bottom[:center]}|#{@bottom[:right]}|\n"
	end
	

	private
	# Set up the writers as private methods
	attr_writer :top, :middle, :bottom
end
