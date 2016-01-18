class Author < ActiveRecord::Base
  	has_many :publishers
  	has_many :books
  	validates :name,presence: true,length:{minimum: 2,maximum: 16}
end
