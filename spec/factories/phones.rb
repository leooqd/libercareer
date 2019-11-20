# frozen_string_literal: true

FactoryBot.define do
  factory :phone do
    person {create(:person)}
    ddd {Faker::PhoneNumber.subscriber_number(length: 2)}
    number {Faker::PhoneNumber.subscriber_number(length: 9)}
    kind {['comercial', 'particular', 'trabalho'].sample }
  end
end
