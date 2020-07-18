class IdValidator < ActiveModel::Validator
    def validate(record)
       if options[:fields].any?{|field| record.send(field) == @iddd }
       	      record.errors[:base] << "This value is incorrect"
    end
    end
end
class Task < ApplicationRecord
	  include ActiveModel::Validations

	validates :name, :lname ,presence: true
    validates_with IdValidator, fields: [:idd]

end