# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'is valid' do
    person = create(:person)
    expect(person).to be_valid
  end
  it "returns the correct full_name" do
    name = Faker::Name.name
    last_name = Faker::Name.last_name
    person = create(:person, name: name, last_name: last_name)
    expect(person.full_name).to eq("#{name} #{last_name}")
  end
  it "returns the correct method age" do
    person = create(:person)
    expect(person.age).to eq(((Time.zone.now - person.birth_date.to_time) / 1.year.seconds).floor)
  end
  it "returns the correct method set_preferred!" do
    person = create(:person)
    phone = create(:phone, person: person)
    expect(person.set_preferred!(phone.id)).to eq(true)
  end
  it 'is not valid without name' do
    person = build(:person, name: nil)
    expect(person).to_not be_valid
  end
  it 'is not valid without email' do
    person = build(:person, email: nil)
    expect(person).to_not be_valid
  end
  it 'is not valid without document' do
    person = build(:person, document: nil)
    expect(person).to_not be_valid
  end
  it 'is not valid without birth_date' do
    person = build(:person, birth_date: nil)
    expect(person).to_not be_valid
  end
  it 'is not valid if document already registered' do
    person_one = create(:person)
    person_two = build(:person, document: person_one.document)
    expect(person_two).to_not be_valid
  end
end