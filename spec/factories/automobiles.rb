# frozen_string_literal: true

FactoryBot.define do
  factory :automobile do
    model { Faker::Vehicle.make_and_model }
    color { Faker::Color.color_name }
    kind { ["car", "motorcycle", "vuc", "truck", "bus"].sample }
    license_plate { Faker::Vehicle.license_plate }
    cost { rand(100.0..500.0) }
  end
end
