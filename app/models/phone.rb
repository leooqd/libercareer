class Phone < ApplicationRecord

	belongs_to :person
	has_one :preferred, foreign_key: "preferred_phone_id"

	validates_presence_of :number, :ddd, :kind

	validates :number, :uniqueness => {:scope => [:person, :ddd], :message => " --> já cadastrado para essa pessoa."}, on: :create

	def full_number
		"#{self.ddd} #{self.number}"
	end

end
