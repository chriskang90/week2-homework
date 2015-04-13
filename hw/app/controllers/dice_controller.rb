# Valid statuses: start, win, lose, continue

class DiceController < ApplicationController

	# This method defines the action to play the Craps game
	def play
		# Retrieve two random numbers as the roll
		@numbers = [1,2,3,4,5,6].sample(2)

		# Check if user has a target
		if params["target"]
			@target = params["target"]
			@status = target_roll(@numbers[0], @numbers[1], @target)

		# User does not have a target
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
		elsif (total == target)
			return "win"
		else
			return "continue"
		end
	end

end