class EcomsController < ApplicationController

  	def index
  		@ecom=Book.all
  	end
end
