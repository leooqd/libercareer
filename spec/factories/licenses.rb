# frozen_string_literal: true

FactoryBot.define do
  factory :license do
  	person {create(:person)}
  	number { Faker::Number.number(digits: 10) }
  	modalities_ids { [1, 2, 3, 4, 5].sample(1 + rand(5)) }
  	expiration { Faker::Date.between(from: Date.today, to: 3.year.from_now) }
  end
end
