class Book < ActiveRecord::Base
	belongs_to :publisher
	belongs_to :author

	validates :title,presence: true,length:{maximum: 10,too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"}
  validates :price,presence: true ,numericality: true
  validates :isbn,presence:true,length:{minimum: 10,too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"}
  
    
  def self.search(search)
  		if search
    		  where(["title like ? OR isbn like ? OR price like ? ", "%#{search}%","%#{search}%","%#{search}%"])
  		else
      	where( " isbn like? ", "%#{search}%")
  		
 		 end
	end

mount_uploader :image,ImageUploader

end

