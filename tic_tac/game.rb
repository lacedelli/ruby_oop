require_relative 'board.rb'

class Game
	attr_reader :player_turn, :p1_rounds, :p2_rounds, :board

	def initialize()
		# set up the round counter for each player
		@p1_rounds = 0
		@p2_rounds = 0
		# Player turn to be decided with modulo op.
		@player_turn = 0
		# Instatiate board
		@board = Board.new()
	end
	# Override to_s to print the board.
	def to_s()
		@board.to_s
	end

	# Method that plays a round of the game
	def play_round(char)
		char = char
		# TODO Call char_to_player to write a properly formatted line
		# Ask the player for a move
		puts self.to_s()
		puts "Please write your move, the options are:\n"\
				 "'top', 'middle' and 'bottom' for the rows, and\n"\
				 "'left', 'center', and 'right' for the columns.\n"\
				 "Please write them with a space between words, like so: 'top right'.\n"
		move = gets.split()
		# Check for typos in the answer
		# TODO call a board method that only exits if the move is valid
		# TODO call the board method to set the move
	end

	# Play a single match of the game
	def play_match()
		char = get_player()
		#start a loop 
		player_won = false
		while not player_won
			#play a round
			self.play_round(char)
			#check for win condition
			if self.board.line_complete?(char)
				if char == "X"
					puts "Player 1 won!"
					self.p1_rounds += 1
				else
					puts "Player 2 won!"
					self.p2_rounds += 1
				end
				puts self.to_s()
				player_won = true
			end
			#TODO check for stalemate
			#TODO after the round is done, add one to the turn switch
		end	
			end	
	 
	def play_game()
		#print a message welcoming players
		puts "Let's play tic-tac-toe!"

		continue_game = true
		while continue_game
			play_match()
			#ask if players want another go
			puts "Do you want to play another round? Y/N"
			if gets.chomp.downcase == "y" || gets.chomp.downcase == "yes"
				# Create a new board for the new game
				# TODO Write the ongoing score
				self.board = Board.new()
				play_match()
			else
				puts "Thank you for playing! The final scores were:\n"\
						 "Player 1: #{p1_rounds}, Player 2: #{p2_rounds}."
				continue_game = false
			end
		end

	end

	private
	attr_writer :player_turn, :p1_rounds, :p2_rounds, :board

	def get_player()
		if self.player_turn % 2 == 0
			return "X"
		else
			return "O"
		end
	end

	def char_to_player(char)
		if char == "X"
			return "Player 1"
		elsif char == "O"
			return "Player 2"
		end
	end

end

game = Game.new
game.play_game
