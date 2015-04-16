# This class is the controller for the greet page.  It will check to see if there is a query string parameter (salutation) to use as the string
# for the greet.

class GreetController < ApplicationController

	def show
		if params["salutation"]			# If saluation parameter exists (i.e. not null)
			@salutation = params["salutation"]
		else
			@salutation = "Hello"		# Default salutation
		end
	end

end