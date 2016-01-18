class Publisher < ActiveRecord::Base
	has_many :books
	has_many :authors
	validates :name,presence: true,length:{minimum: 3,too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"}
end
