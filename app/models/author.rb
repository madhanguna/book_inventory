class Author < ActiveRecord::Base
	has_many :books
	has_many :publishers
	validates :name,presence: true,length:{minimum: 3,maximum: 10}
end
