
class CartsController < ApplicationController
	before_filter :authorize ,only: [:add,:clearCart,:index] 
	after_filter :authorize ,only: [:index] 
	def add_cart
		id=params[:id]
		if session[:cart] then
			cart=session[:cart]
		else
			session[:cart]={}
			cart=session[:cart]
		end

		if cart[id] then
			cart[id]=cart[id]+1
		else
			cart[id]=1
		end
		redirect_to :action=>"index"

	end
  def clearCart
		  # session.data[:foo]
		  	
		 	session[:cart]=nil
		 	

  			redirect_to :action => "index"
  			#redirect_to carts_path
			
	end

	def index
		if session[:cart] then
		 @cart=session[:cart]
		

			
		else
			@cart={}
		end

	end
	def destroy
  		if session[:cart] then
  			cart=session[:cart]
  			session[:cart].delete(params[:id])
		 #session[:cart].delete(:id)
		 #@cart=session[:cart]

		redirect_to :action => "index"	
		else
			@cart={}
		end  		
 		
	end
	

#def remove_book_from_cart(product_id)
   # product_id = product_id.to_s
    #cart_books_hash.delete(product_id)
#end


end

 