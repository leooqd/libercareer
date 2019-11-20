# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rent, type: :model do

  before(:each) {
    @person = create(:person)
    @license = create(:license, person: @person, modalities_ids: [1])
    @automobile = create(:automobile, kind: 1, license_plate: "CXC-0000")
  }

  it 'is valid' do
    rent = build(:rent, person: @person, automobile: @automobile)
    expect(rent).to be_valid
  end
  it 'is not valid without start_date' do
    rent = build(:rent, person: @person, automobile: @automobile, start_date: nil)
    expect(rent).to_not be_valid
  end
  it 'is not valid without end_date' do
    rent = build(:rent, person: @person, automobile: @automobile, end_date: nil)
    expect(rent).to_not be_valid
  end
  it 'is not valid rent time' do
    rent = build(:rent, person: @person, automobile: @automobile, start_date: Faker::Date.between(from: 10.days.ago, to: Date.today), end_date: Faker::Date.between(from: 5.days.from_now, to: 10.days.from_now))
    expect(rent).to_not be_valid
  end
  it 'is not be rented today' do
    automobile = create(:automobile, kind: 1, license_plate: "AAA-0004")
    rent = build(:rent, person: @person, automobile: automobile, start_date: Date.today.next_week(:wednesday), end_date: (Date.today.next_week(:wednesday))+2.day)
    expect(rent).to_not be_valid
  end
  it 'is not valid if client has open rent ' do
    rent_one = create(:rent, person: @person, automobile: @automobile)
    automobile = create(:automobile, kind: 1, license_plate: "AAA-0000")
    rent = build(:rent, person: @person, automobile: automobile)
    expect(rent).to_not be_valid
  end
  it 'is not valid if automobile already rented' do
    rent_one = create(:rent, person: @person, automobile: @automobile)
    person = create(:person)
    create(:license, person: person, modalities_ids: [1,2])
    rent = build(:rent, person: person, automobile: @automobile)
    expect(rent).to_not be_valid
  end
  it 'is not valid if insufficient age' do
    person = create(:person, birth_date: Faker::Date.birthday(min_age: 10, max_age: 21))
    create(:license, person: person, modalities_ids: [1,2])
    rent = build(:rent, person: person, automobile: @automobile)
    expect(rent).to_not be_valid
  end
  it 'is not valid license' do
    person = create(:person)
    create(:license, person: person, modalities_ids: [2], expiration: Faker::Date.between(from: 10.year.ago, to: Date.yesterday))
    rent = build(:rent, person: person, automobile: @automobile)
    expect(rent).to_not be_valid
  end
  it 'is not a motorcycle license' do
    person = create(:person)
    create(:license, person: person, modalities_ids: [2])
    rent = build(:rent, person: person, automobile: @automobile)
    expect(rent).to_not be_valid
  end
  it 'is not a car/vuc license' do
    automobile = create(:automobile, kind: 2, license_plate: "AAA-0000")
    rent = build(:rent, person: @person, automobile: automobile)
    expect(rent).to_not be_valid
  end
  it 'is not a truck license' do
    automobile = create(:automobile, kind: 3, license_plate: "AAA-0000")
    rent = build(:rent, person: @person, automobile: automobile)
    expect(rent).to_not be_valid
  end
  it 'is not a bus license' do
    automobile = create(:automobile, kind: 4, license_plate: "AAA-0000")
    rent = build(:rent, person: @person, automobile: automobile)
    expect(rent).to_not be_valid
  end
  it 'is not sufficient age to get a bus' do
    person = create(:person, birth_date: Faker::Date.birthday(min_age: 22, max_age: 40))
    create(:license, person: person, modalities_ids: [1,2,3,4,5])
    automobile = create(:automobile, kind: 4, license_plate: "AAA-0000")
    rent = build(:rent, person: person, automobile: automobile)
    expect(rent).to_not be_valid
  end
  it 'is not sufficient age to get a truck' do
    person = create(:person, birth_date: Faker::Date.birthday(min_age: 22, max_age: 60))
    create(:license, person: person, modalities_ids: [1,2,3,4,5])
    automobile = create(:automobile, kind: 3, license_plate: "AAA-0000")
    rent = build(:rent, person: person, automobile: automobile)
    expect(rent).to_not be_valid
  end
end