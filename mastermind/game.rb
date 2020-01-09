require_relative "players.rb"
require_relative "board.rb"
class Game
	attr_reader :board, :pc, :npc, :player_switch, :player_scores

	def initialize()
		# TODO set up players
		@pc = Player.new()
		@npc = ComputerPlayer.new()
		# Set up board
		@board = Board.new()
		# create variable for guesses
		@player_switch = 0
		@player_scores = {:pc => 0, :npc => 0}
	end

	def play_round(guesses_num)
		# restart variable for guesses
		guesses = []
		score = 0
		# Set up a loop with guesses as a limit
		guesses_num.times do |i|
			# Get a guess from active player
			if self.player_switch % 2 == 0
				guesses = self.pc.make_guess(guesses_num)
			else
				guesses = self.npc.make_guess(guesses_num)
				self.npc.assess_guess(self.board.assess_guess(guesses))
			end
			puts self.board.assess_guess(guesses, true)
			if self.board.all_guesses_correct?(guesses)
				break
			end
			puts "Make a new guess!"
		end
		puts "Round ended!"
		# If loop ends, end game and assign points
		guesses = self.board.assess_guess(guesses)
		guesses.map do |guess|
			if guess == "G"
				score += 1
			end
		end

		if self.player_switch % 2 == 0
			self.player_scores[:npc] += score
		else
			self.player_scores[:pc] += score
		end
	end

	def play_game()
		# Define the amount of spaces that will be in the code
		puts "Please set the number of spaces in the code"	
		spaces = 0 
		while spaces <= 0 || nil
			spaces = gets.chomp().to_i()
		end
		if self.player_switch % 2 == 0
			self.board.create_board(self.npc.get_code(spaces))
		else
			puts "/nIt's your turn to make a code!/n"
			self.board.create_board(self.pc.get_code(spaces))
		end

		# set up a loop
		loop do
			# Play a round
			self.play_round(spaces)	
			puts "the round ended!, the secret code was: #{self.board.to_s()}"
			# Print scores, ask if player wants to play another round
			puts "The current scores are #{self.player_scores[:pc]} points for you, and #{self.player_scores[:npc]} for the \"computer.\""
			# If player says yes, continue loop
			puts "Do you want to play another round? Y/N"
			answer = gets().chomp()
			unless /[yY]/.match?(answer)
				break
			end
			self.player_switch += 1
			if self.player_switch % 2 == 0
				self.board.create_board(self.npc.get_code(spaces))
			else
				puts "It's your turn to make a code!"
				self.board.create_board(self.pc.get_code(spaces))
			end
		end
	end
	
	private 
	attr_writer :board, :pc, :npc, :player_switch, :player_scores
end
