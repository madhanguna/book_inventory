
class CartsController < ApplicationController
  	before_filter :authorize ,only: [:add,:clear_cart,:index] 

  	def add
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

  	def clear_cart
  	 	 session[:cart] = nil
  		 render "index"
  	end

  	def index
      	if session[:cart] then
          	@cart=session[:cart]
  		  else
  			   @cart={}
        end
  	end

  def destroy
      id=params[:id]
      if session[:cart] then
            	cart=session[:cart]
          if cart[id] > 1
            	cart[id] = cart[id] - 1
            	session[:cart] = cart
          else
            	session[:cart].delete(params[:id])
          end
          		redirect_to :action => "index"
      else
      			@cart={}
      end  
       
  end
end