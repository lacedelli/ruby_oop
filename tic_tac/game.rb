require_relative 'board.rb'

class Game

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
	def play_round()
		# Figure out which player moves and assign character depending on that
		if self.player_turn % 2 == 0
			char = "X"
		else
			char = "O"
		end
		puts "It's #{char}'s turn!"
		# Ask the player for a move
		puts self.to_s()
		puts "Please write your move, the options are:\n"\
				 "'top', 'middle' and 'bottom' for the rows, and\n"\
				 "'left', 'center', and 'right' for the columns.\n"\
				 "Please write them with a space between words, like so: 'top right'."
		move = gets.split()
		# Check for typos in the answer
		while @board.understands?(move[0], move[1]).include?(false)
			puts "I'm sorry, I could not understand the move,\n"\
					 "Could you please write it again for me?"
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
	def play()
		if self.player_turn % 2 == 0
			char = "X"
		else
			char = "O"
		end
		#print a message welcoming players
		puts "Let's play tic-tac-toe!"
		#start a loop 
		player_won = false
		while not player_won
			#play a round
			self.play_round()
			#check for win condition
			if self.board.line_complete?(char)
				if char == "X"
					self.p1_rounds += 1
				else
					self.p2_rounds += 1
				end
				player_won = true
			end
			#TODO check for stalemate
		end	
		#ask if players want another go
		puts "Do you want to play another round? Y/N"
		if gets.chomp.downcase == "y" || gets.chomp.downcase == "yes"
			player_won = false
		else
			puts "Thank you for playing! The final scores were:\n"\
					 "Player 1: #{p1_rounds}, Player 2: #{p2_rounds}."
		end
	end	
	protected
	attr_accessor :player_turn, :p1_rounds, :p2_rounds, :board
end

game = Game.new
game.play
