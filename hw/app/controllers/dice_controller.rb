# This the controller class for the dice game.  When control is passed to the dice controller, it will generate two independent dice rolls and
# store these in @numbers.  It will then update the status of the player based on whether it was the first roll or a subsequent roll. 
# The valid statuses are: start, win, lose, continue

class DiceController < ApplicationController

	# This method defines the action to play the Craps game
	def play
		# Retrieve two random numbers for the dice roll
		roll1 = [1,2,3,4,5,6].sample
		roll2 = [1,2,3,4,5,6].sample
		@numbers = [roll1, roll2]

		# Check if user has a target
		if params["target"]
			@target = params["target"].to_i
			@status = target_roll(@numbers[0], @numbers[1], @target)

		# User does not have a target so this is the first dice roll
		else
			@target = @numbers[0]+@numbers[1]
			@status = first_roll(@numbers[0], @numbers[1])
		end

	end

	# This method determines whether the player wins, loses, or can continue based on the first roll of the game
	def first_roll(dice1, dice2)
		total = dice1+dice2
		if (total == 7 or total == 11)
			return "win"
		elsif (total == 2 or total == 3 or total == 12)
			return "lose"
		end

		return "start"
	end

	# This method determines whether the player wins, loses, or can continue based on subsequent rolls of the game
	def target_roll(dice1, dice2, target)
		total = dice1+dice2

		if (total == 7)
			return "lose"
		elsif (total == @target)
			return "win"
		else
			return "continue"
		end
	end

end