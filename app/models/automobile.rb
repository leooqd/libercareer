class Automobile < ApplicationRecord

	validates_presence_of :cost, :color, :model, :license_plate, :kind

	scope :ordered, -> {order("automobiles.created_at desc")}

	def full_description
		"#{self.kind} #{self.model} #{self.year} (#{self.color}) - #{self.license_plate}"
	end

end
