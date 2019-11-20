# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Phone, type: :model do
  it 'is valid' do
    phone = create(:phone)
    expect(phone).to be_valid
  end
  it "returns the correct full_number" do
    ddd = Faker::PhoneNumber.subscriber_number(length: 2)
    number = Faker::PhoneNumber.subscriber_number(length: 9)
    phone = create(:phone, ddd: ddd, number: number)
    expect(phone.full_number).to eq("#{ddd} #{number}")
  end
  it 'is not valid without number' do
    phone = build(:phone, number: nil)
    expect(phone).to_not be_valid
  end
  it 'is not valid without ddd' do
    phone = build(:phone, ddd: nil)
    expect(phone).to_not be_valid
  end
  it 'is not valid without kind' do
    phone = build(:phone, kind: nil)
    expect(phone).to_not be_valid
  end
end