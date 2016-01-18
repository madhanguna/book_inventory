
class BooksController < ApplicationController

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
				flash[:notice]="Book created successfully"
				redirect_to @book
			else
				 render 'new'
			end
	end

	def update
			@book=Book.find(params[:id])
			if @book.update(book_params)
					flash[:notice]="Book updated successfully"
				redirect_to @book
			else
				render 'edit'
			end
	end

	def destroy
  		@book = Book.find(params[:id])
  		@book.destroy
  		flash[:notice]="Book deleted successfully"
  		redirect_to @book
 	end

	

	private
	def book_params
		params.require(:book).permit(:title,:price,:available,:isbn,:author_id,:publisher_id,:image,:quantity)
	end
end
