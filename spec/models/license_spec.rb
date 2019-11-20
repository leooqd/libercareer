# frozen_string_literal: true

require 'rails_helper'

RSpec.describe License, type: :model do
  it 'is valid' do
    license = create(:license)
    expect(license).to be_valid
  end
  it "returns the correct method modalities" do
    license = create(:license)
    expect(license.modalities&.ids).to eq(Modality.where(id: license.modalities_ids)&.ids)
  end
  it "returns the correct method expired?" do
    license = create(:license)
    expect(license.expired?).to eq(license.expiration.to_date < Date.today)
  end
  it 'is not valid without number' do
    license = build(:license, number: nil)
    expect(license).to_not be_valid
  end
  it 'is not valid without person' do
    license = build(:license, person: nil)
    expect(license).to_not be_valid
  end
  it 'is not valid without expiration' do
    license = build(:license, expiration: nil)
    expect(license).to_not be_valid
  end
  it 'is not valid without modalities_ids' do
    license = build(:license, modalities_ids: nil)
    expect(license).to_not be_valid
  end
  it 'is not valid if number already registered' do
    license_one = create(:license)
    license_two = build(:license, number: license_one.number)
    expect(license_two).to_not be_valid
  end
end