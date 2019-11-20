class Automobile < ApplicationRecord

  enum kind: [:car, :motorcycle, :vuc, :truck, :bus] 

  has_many :rents

	validates_presence_of :cost, :color, :model, :license_plate, :kind

	scope :ordered, -> {order("automobiles.created_at desc")}

	def full_description
		"#{self.kind} #{self.model} #{self.year} (#{self.color}) - #{self.license_plate}"
	end

  def self.kind_to_select
    kinds.map do |r, key|
     [I18n.t("automobile.kind.#{r}"), r]
    end
  end

end
