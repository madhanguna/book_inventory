class OrdersController < ApplicationController
	
	def new
  end

	def pay
	end

	def index
		@order=Order.all
	end

	def add_order
				@cart=session[:cart]
		@cart.each do |id,quantity| 
	    	@book=Book.find_by_id(id) 
				@order = Order.new
				@order[:title] = @book[:title]
				@order[:price] = @book[:price]
				@order[:isbn] = @book[:isbn]
				@order[:title] = @book[:title]
				@order[:quantity] =quantity
				@book[:quantity] = @book[:quantity].to_i-@order[:quantity].to_i
		end
				if @order.save
					@book.update_attributes(:quantity=>@book[:quantity])
					redirect_to action:"index"
				else
					redirect_to carts_path
				end
	end
end
