# frozen_string_literal: true

FactoryBot.define do
  factory :modality do
  	category { ['Categoria A', 'Categoria B', 'Categoria C', 'Categoria D', 'Categoria E' ].sample }
  end
end
