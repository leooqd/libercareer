# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Modality, type: :model do
  it 'is valid' do
    modality = create(:modality)
    expect(modality).to be_valid
  end
  it 'is not valid without number' do
    modality = build(:modality, category: nil)
    expect(modality).to_not be_valid
  end
end