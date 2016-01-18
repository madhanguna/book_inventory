class Cart < ActiveRecord::Base
	belongs_to :publisher
	belongs_to :author


has_many :books

 def self.total_price
 	cart = Cart.all
    cart.to_a.sum(&:price)
 end

 end