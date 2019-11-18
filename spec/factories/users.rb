FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {"senha"}
  end
end
