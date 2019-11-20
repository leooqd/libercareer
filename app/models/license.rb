# frozen_string_literal: true

class License < ApplicationRecord
  belongs_to :person
  validates_presence_of :number, :person, :expiration, :modalities_ids
  validates :number, uniqueness: { scope: [:person], message: ' --> já cadastrado para essa pessoa.' }, on: :create
  scope :ordered, -> { order('licenses.created_at desc') }

  before_validation do |license|
    license.modalities_ids&.reject!(&:blank?)
  end

  def modalities
    Modality.where(id: modalities_ids)
  end

  def expired?
    expiration.to_date < Date.today
  end
end
