
class BooksController < ApplicationController
	before_filter :authorize ,only: [:edit,:update,:create,:destroy] 
	
	def new
		@book=Book.new
	end
	
	def show
		@book=Book.find(params[:id])
	end

	def index
		
		@books=Book.paginate(:page => params[:page],:per_page => 1)
		@book = Book.search(params[:search])
		
		
	end

	def edit
		@book=Book.find(params[:id])
	end

	def create
		@book=Book.new(book_params)
		if @book.save

		 redirect_to @book,notice:"Book was successfully created"
		else

		 render 'new'
		end
	end

	def update
		@book=Book.find(params[:id])
		if @book.update(book_params)
			redirect_to @book
		else
			render 'edit'
		end
	end

	def destroy
  		@book = Book.find(params[:id])
  		@book.destroy
  		redirect_to @book
 		
	end

	

	private
	def book_params
		params.require(:book).permit(:title,:price,:available,:isbn,:author_id,:publisher_id)
	end
end
