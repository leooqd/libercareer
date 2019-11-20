# frozen_string_literal: true

FactoryBot.define do
  factory :rent do
    person {create(:person)}
    automobile {create(:automobile)}
    cost {rand(100.0..2000.0)}
    start_date { Date.today }
    end_date { Faker::Date.between(from: Date.tomorrow, to: rand(1..3).day.from_now )}
  end
end
