require_relative "players.rb"
require_relative "board.rb"
class Game
	attr_reader :board, :pc, :npc, :code, :code_length, :player_switch, :current_guess

	def initialize()
		# TODO set up players
		@pc = Player.new()
		@npc = ComputerPlayer.new()
		# Set up board
		@board = Board.new()
		# create variable for guesses
		@code = Array.new()
		@code_length = Integer.new()
		@player_switch = 0
		@current_guess = Array.new()
	end

	def play_round(guesses_num)
		# TODO restart variable for guesses
		guesses = []
		# TODO Use a switch to determine the player that will create the code
		if self.switch % 2 == 0
			self.code = self.npc.get_code(guesses_num)
		else
			puts "It's your turn to make a code!"
			self.code = self.pc.get_code(guesses_num)
		end
		# TODO Set up a loop with guesses as a limit
		guesses_num.each do
			# TODO Get a guess from active player
			if self.switch % 2 == 0
				self.guesses = self.pc.make_guess(guesses_num)
			else
				self.guesses = self.npc.make_guess(guesses_num)
				self.npc.assess_guess(guesses)
			end
			# TODO Compare guess with current board
			# TODO if guess is correct, end loop
		end
		# TODO if loop ends, end game and assign points
	end

	def play_game()
		# TODO Define the amount of spaces that will be in the code
		# TODO set up a loop
			# TODO play a round
			# TODO print scores, ask if player wants to play another round
			# TODO if player says yes, continue loop
			# TODO Else, break
	end
	
	private 
	attr_writer :board, :pc, :npc, :code, :code_length, :player_switch, :current_guesses
end
