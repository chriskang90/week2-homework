class ContactController < ApplicationController

	def index
		# no instance variables required
	end


	def submit
		@first = params['first']	# retrieve first name
		@second = params['second']  # retrieve second name
	end

end