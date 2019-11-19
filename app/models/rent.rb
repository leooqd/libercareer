class Rent < ApplicationRecord

	belongs_to :person
	belongs_to :automobile

	validates_presence_of :cost, :start_date, :end_date 

	scope :ordered, -> {order("rents.created_at desc")}

	def pickup!
		self.update(pickup_date: Date.today)
	end

	def return!
		self.update(return_date: Date.today)
	end



end
