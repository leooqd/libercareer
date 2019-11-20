# frozen_string_literal: true

class LicenseModality < ApplicationRecord
  belongs_to :modality
  belongs_to :license
end
