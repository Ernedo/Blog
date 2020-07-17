class Task < ApplicationRecord
	validates :name, :lname ,presence: true
end
