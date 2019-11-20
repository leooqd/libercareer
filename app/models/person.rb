# frozen_string_literal: true

class Person < ApplicationRecord
  belongs_to :preferred_phone, class_name: 'Phone', optional: true
  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true
  has_many :rents
  has_one :license, dependent: :destroy
  accepts_nested_attributes_for :license

  validates_presence_of :name, :email, :document, :birth_date
  validates_uniqueness_of :document

  scope :ordered, -> { order('people.created_at desc') }
  scope :order_name, -> { order('people.name asc') }
  scope :age_between, lambda { |from_age, to_age|
    if from_age.present? && to_age.present?
      where(birth_date: (Date.today - to_age.to_i.year)..(Date.today - from_age.to_i.year))
    end
  }

  ransacker :age, formatter: proc { |v| Date.today - v.to_i.year } do |parent|
    parent.table[:birth_date]
  end

  after_commit :set_preferred_phone, if: -> { preferred_phone.blank? && phones.any? }

  def full_name
    "#{name} #{last_name}"
  end

  def set_preferred_phone
    update(preferred_phone_id: phones.first&.id)
  end

  def set_preferred!(phone_id)
    update(preferred_phone_id: phone_id)
  end

  def age
    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end
end
