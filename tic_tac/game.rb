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
		# Call char_to_player to write a properly formatted line
		puts "It's #{self.char_to_player(char)}'s turn!"
		# Ask the player for a move
		puts self.to_s()
		puts "Please write your move, the options are:\n"\
				 "'top', 'middle' and 'bottom' for the rows, and\n"\
				 "'left', 'center', and 'right' for the columns.\n"\
				 "Please write them with a space between words, like so: 'top right'.\n"
		# Get the move from the board class.
		move = board.get_move()
		# call the board method to set the move
		board.set_value(move[0], move[1], char)
	end

	# Play a single match of the game
	def play_match()
		#start a loop 
		game_end = false
		while not game_end
			char = get_player()
			#play a round
			self.play_round(char)
			self.player_turn += 1
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
				game_end = true
				break
			end
			# check for stalemate
			game_end = true if board.stalemate?()
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
				# Write the ongoing score
				puts "The ongoing score is: Player 1: #{p1_rounds},"\
				    	"Player 2: #{p2_rounds}."

				self.board = Board.new()
				play_match()
			else
				puts "Thank you for playing! The final scores were:\n"\
						 "Player 1: #{p1_rounds}, Player 2: #{p2_rounds}."
				continue_game = false
			end
		end

	end

	def char_to_player(char)
		if char == "X"
			return "Player 1"
		elsif char == "O"
			return "Player 2"
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


end

game = Game.new
game.play_game
