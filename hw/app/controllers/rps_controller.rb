class RpsController < ApplicationController

	# This method creates an instance variable for all the moves in rock-paper-scissors
	def index
		@moves = moves_list
	end

	# This method retrieves the player's move, randomly generates a move for the computer, and determines the winner using another method
	def play
		# retreive player choice from URL parameter
		@player = params["choice"]

		# moves_list.sample returns a one-element array and we extract the first element with [0]
		@computer = moves_list.sample(1)[0]

		# determine the winner
		@winner = determine_winner(@player, @computer)
	end

	# This method determines the winner of the rock-paper-scissors game given the player and computer moves
	def determine_winner(player, computer)
		if player == computer
			return "tie"
		elsif player == "rock" 
			if computer == "paper"
				return "computer"
			elsif computer == "scissors"
				return "player"
			end
		elsif player == "paper"
			if computer == "rock"
				return "player"
			elsif computer == "scissors"
				return "computer"
			end
		else
			if computer == "rock"
				return "computer"
			elsif computer == "paper"
				return "player"
			end
		end
	end

	# This method defines the list of moves in rock-paper-scissors
	def moves_list
		return ["rock", "paper", "scissors"]
	end

end