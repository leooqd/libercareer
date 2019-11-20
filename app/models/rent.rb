class Rent < ApplicationRecord

	belongs_to :person
	belongs_to :automobile

	validates_presence_of :start_date, :end_date
	validates :cost, numericality: { greater_than: 0 }

	validate :check_rules, on: :create

	scope :ordered, -> {order("rents.created_at desc")}
	scope :completeds, -> {where.not(return_date: nil)}

	before_validation :set_cost
	after_update_commit :set_loyal

	def pickup!
		self.update(pickup_date: Date.today)
	end

	def return!
		self.update(return_date: Date.today)
	end

	def set_loyal
		if self.person&.rents&.completeds&.count.to_i >= 2
			self.person.update(loyal: true)
		end
	end

	def set_cost
		begin
			days = self.end_date-self.start_date
			self.cost = self.automobile&.cost.to_f*days
		rescue Exception => e
			errors.add(:erro, e)
		end
	end

	def check_rules
		if self.person&.rents&.where(return_date: nil)&.any?
			errors.add(:erro, '~> cliente possui locação pendente')
		end
		if self.person.present? and self.person&.age <= 21
			errors.add(:erro, '~> idade insuficiente para alugar qualquer automóvel.')
		end
		if self.automobile&.motorcycle? and self.person.license.modalities_ids.exclude?(1)
			errors.add(:erro, '~> cliente não possui habilitação de moto.')
		end
		if (self.automobile&.car? or self.automobile&.vuc?) and self.person.license.modalities_ids.exclude?(2)
			errors.add(:erro, '~> cliente não possui habilitação de carro/vuc')
		end
		if self.automobile&.bus? and self.person&.age <= 40 
			errors.add(:erro, '~> idade insuficiente para alugar ônibus.')
		end
		if self.automobile&.bus? and self.person.license.modalities_ids.exclude?(4)
			errors.add(:erro, '~> cliente não possui habilitação de ônibus.')
		end
		if self.automobile&.truck? and self.person&.age <= 60 
			errors.add(:erro, '~> idade insuficiente para alugar caminhão.')
		end
		if self.automobile&.truck? and self.person.license.modalities_ids.exclude?(3)
			errors.add(:erro, '~> cliente não possui habilitação de caminhão.')
		end
		if self.end_date.present? and self.start_date.present? and ((self.end_date.to_time - self.start_date.to_time) / 1.day.seconds).floor >= 4 and self.person&.rents&.completeds&.count.to_i < 2
			errors.add(:erro, '~> tempo de locação muito longa.')
		end
		if self.person.license.expired?
			errors.add(:erro, '~> Habilitação está expirada.')
		end
		if self.start_date.present? and self.start_date.to_time.wednesday? and self.automobile.license_plate[-1] == '4'
			errors.add(:erro, '~> Este automóvel não pode ser alugado hoje.')
		end
		if self.automobile.present? and self.automobile.rents.where(return_date: nil).any?
			errors.add(:erro, '~> Este automóvel já está alugado.')
		end
	end

end
