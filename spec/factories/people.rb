# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    document { CPF.generate(true) }
    birth_date { Faker::Date.birthday(min_age: 22, max_age: 65) }
  end
end
