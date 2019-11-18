class Rent < ApplicationRecord

	belongs_to :person
	belongs_to :automobile

	validates_presence_of :cost, :start_date, :end_date, :pickup_date, :delivery_date

	scope :ordered, -> {order("rents.created_at desc")}

end
