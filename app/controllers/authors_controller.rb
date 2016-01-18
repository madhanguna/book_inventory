class AuthorsController < ApplicationController
	
	before_filter :authorize ,only: [:edit,:update,:create,:destroy,:index] 
	
	def index
		@author=Author.all
	end

	def show
		@author=Author.find(params[:id])
	end



	def new
		@author=Author.new
	end

	def edit
		@author=Author.find(params[:id])
	end


	def create
			@author=Author.new(author_params)
			if @author.save
				 redirect_to @author
	    else
				  flash[:alert] = "Some errors occured"
					render 'new'
			end
	end

	def update
			@author=Author.find(params[:id])
			if @author.update(author_params)
				redirect_to @author
			else
				render 'edit'
			end
	end

	def destroy
		@author=Author.find(params[:id])
		@author.destroy
		redirect_to @author
	end

	private
	def author_params
		params.require(:author).permit(:name)
	end
end
