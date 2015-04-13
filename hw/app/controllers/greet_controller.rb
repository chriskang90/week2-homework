class GreetController < ApplicationController

	def show
		if params["salutation"]			# If saluation parameter exists (i.e. not null)
			@salutation = params["salutation"]
		else
			@salutation = "Hello"		# Default salutation
		end
	end

end