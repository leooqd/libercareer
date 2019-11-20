# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Automobile, type: :model do
  it 'is valid' do
    automobile = build(:automobile)
    expect(automobile).to be_valid
  end
  it "returns the correct full_description" do
    model = Faker::Vehicle.make_and_model
    color = Faker::Color.color_name
    kind = ["car", "motorcycle", "vuc", "truck", "bus"].sample
    license_plate = Faker::Vehicle.license_plate
    automobile = create(:automobile, kind: kind, model: model, color: color, license_plate: license_plate)
    expect(automobile.full_description).to eq("#{kind} #{model} (#{color}) - #{license_plate}")
  end
  it 'is not valid without cost' do
    automobile = build(:automobile, cost: nil)
    expect(automobile).to_not be_valid
  end
  it 'is not valid without color' do
    automobile = build(:automobile, color: nil)
    expect(automobile).to_not be_valid
  end
  it 'is not valid without model' do
    automobile = build(:automobile, model: nil)
    expect(automobile).to_not be_valid
  end
  it 'is not valid without license_plate' do
    automobile = build(:automobile, license_plate: nil)
    expect(automobile).to_not be_valid
  end
  it 'is not valid without kind' do
    automobile = build(:automobile, kind: nil)
    expect(automobile).to_not be_valid
  end
end