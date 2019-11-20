# frozen_string_literal: true

class Rent < ApplicationRecord
  belongs_to :person
  belongs_to :automobile

  validates_presence_of :start_date, :end_date
  validates :cost, numericality: { greater_than: 0 }

  validate :check_rules, on: :create

  scope :ordered, -> { order('rents.created_at desc') }
  scope :completeds, -> { where.not(return_date: nil) }

  before_validation :set_cost
  after_update_commit :set_loyal

  def pickup!
    update(pickup_date: Date.today)
  end

  def return!
    update(return_date: Date.today)
  end

  def set_loyal
    person.update(loyal: true) if person&.rents&.completeds&.count.to_i >= 2
  end

  def set_cost
    days = end_date - start_date
    self.cost = automobile&.cost.to_f * days
  rescue Exception => e
    errors.add(:erro, e)
  end

  def check_rules
    if person&.rents&.where(return_date: nil)&.any?
      errors.add(:erro, '~> cliente possui locação pendente')
    end
    if person.present? && (person&.age <= 21)
      errors.add(:erro, '~> idade insuficiente para alugar qualquer automóvel.')
    end
    if automobile&.motorcycle? && person.license.modalities_ids.exclude?(1)
      errors.add(:erro, '~> cliente não possui habilitação de moto.')
    end
    if (automobile&.car? || automobile&.vuc?) && person.license.modalities_ids.exclude?(2)
      errors.add(:erro, '~> cliente não possui habilitação de carro/vuc')
    end
    if automobile&.bus? && (person&.age <= 40)
      errors.add(:erro, '~> idade insuficiente para alugar ônibus.')
    end
    if automobile&.bus? && person.license.modalities_ids.exclude?(4)
      errors.add(:erro, '~> cliente não possui habilitação de ônibus.')
    end
    if automobile&.truck? && (person&.age <= 60)
      errors.add(:erro, '~> idade insuficiente para alugar caminhão.')
    end
    if automobile&.truck? && person.license.modalities_ids.exclude?(3)
      errors.add(:erro, '~> cliente não possui habilitação de caminhão.')
    end
    if end_date.present? && start_date.present? && (((end_date.to_time - start_date.to_time) / 1.day.seconds).floor >= 4) && (person&.rents&.completeds&.count.to_i < 2)
      errors.add(:erro, '~> tempo de locação muito longa.')
    end
    if person.license.expired?
      errors.add(:erro, '~> Habilitação está expirada.')
    end
    if start_date.present? && start_date.to_time.wednesday? && (automobile.license_plate[-1] == '4')
      errors.add(:erro, '~> Este automóvel não pode ser alugado hoje.')
    end
    if automobile.present? && automobile.rents.where(return_date: nil).any?
      errors.add(:erro, '~> Este automóvel já está alugado.')
    end
  end
end
