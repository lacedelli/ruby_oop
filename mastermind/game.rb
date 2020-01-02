require_relative "players.rb"
require_relative "board.rb"
class Game
	attr_reader :board, :pc, :npc, :code_length, :player_switch, :current_guess

	def initialize()
		# TODO set up players
		@pc = Player.new()
		@npc = ComputerPlayer.new()
		# Set up board
		@board = Board.new()
		# create variable for guesses
		@code_length 
		@player_switch = 0
		@current_guess = Array.new()
	end

	def play_round(guesses_num)
		# TODO restart variable for guesses
		guesses = []
		# TODO Set up a loop with guesses as a limit
		guesses_num.times do |i|
			# TODO Get a guess from active player
			if self.player_switch % 2 == 0
				guesses = self.pc.make_guess(guesses_num)
			else
				guesses = self.npc.make_guess(guesses_num)
				self.npc.assess_guess(guesses)
			end
			puts self.board.assess_guess(guesses, true)
			if self.board.all_guesses_correct?(guesses)
				break
			end
		end
		puts "Round ended!"
		
		# TODO if loop ends, end game and assign points
	end

	def play_game()
		# Define the amount of spaces that will be in the code
		puts "Please set the number of spaces in the code"	
		spaces = 0 
		while spaces <= 0 || nil
			begin
				spaces = gets.chomp().to_i()
			rescue NoMethodError
				puts "That value cannot be converted to an integer value."
			end
		end
			if self.player_switch % 2 == 0
				self.board.create_board(self.npc.get_code(spaces))
			else
				puts "It's your turn to make a code!"
				self.board.create_board(self.pc.get_code(spaces))
			end
		# set up a loop
		loop do
			# TODO play a round
			self.play_round(spaces)	
			# TODO print scores, ask if player wants to play another round
			# TODO if player says yes, continue loop
			# TODO Else, break
		end
	end
	
	private 
	attr_writer :board, :pc, :npc, :code_length, :player_switch, :current_guesses
end
