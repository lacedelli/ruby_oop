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
		puts "It's #{char}'s turn!"
		# Ask the player for a move
		puts self.to_s()
		puts "Please write your move, the options are:\n"\
				 "'top', 'middle' and 'bottom' for the rows, and\n"\
				 "'left', 'center', and 'right' for the columns.\n"\
				 "Please write them with a space between words, like so: 'top right'.\n"
		move = gets.split()
		# Check for typos in the answer
		# TODO find a way to encapsulate this code in such a way that whenever
		# the code is rejected, the input has to be filtered all the way through
		# from the beginning, so that the direction is properly parsed
		# and the user gets the correct message on each step.
		while @board.understands?(move[0], move[1]).include?(false)
			puts "I'm sorry, I could not understand the move,\n"\
					 "Could you please write it again for me?\n"
			move = gets.split()
		end
		# Check if the move is valid by confirming it is an empty space
		while not self.board.valid_move?(move[0], move[1])
			move = gets.split()
		end
		# Make the move
		self.board.set_value(move[0], move[1], char)
		# add to player counter, changing turn
		self.player_turn += 1
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
					# TODO find out why the game doesn't end here
					puts "Player 2 won!"
					self.p2_rounds += 1
				end
				puts self.to_s()
				player_won = true
			end
			#TODO check for stalemate
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

	def get_move()

	end

end

game = Game.new
game.play_game
