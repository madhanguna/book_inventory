class OrdersController < ApplicationController
	before_filter :authorize ,only: [:add_order,:index] 
	#def index
	#	render json: Book.find(params[:id])
		#render json: session[:cart]
		#@book = Book.all
		#render json: Book.select{|i| i == @book.id}
		#render json: @book.each{|k| puts k[:id]}
        
	#end

	def add_order	
		@book = Book.find(params[:id])		
		@order = Order.new
		@order[:title] = @book[:title]
		@order[:price] = @book[:price].to_i*params[:quantity].to_i
		@order[:isbn] = @book[:isbn]
		@order[:title] = @book[:title]
		@order[:quantity] = params[:quantity]
		if @order.save
			redirect_to action:"index"
		else

		end
		#render json: @order
		#render json: Book.find(params[:id])
		#render json: session[:cart].each_pair{|k,v| v}
	end
	def index
		@order = Order.all
	end

end	