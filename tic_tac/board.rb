class Board
	attr_accessor :top, :middle, :bottom
	def initialize()
		@top = {:right => " ",
						:center => " ",
						:left => " "}
		@middle = {:right => " ",
						   :center => " ",
							 :left => " "}
		@bottom = {:rigt => " ",
						   :center => " ",
							 :left => " "}
	end
end
