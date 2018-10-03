FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::AquaTeenHungerForce.character }
    unit_price { rand(100..100000) }
    merchant_id { rand(1..100) }
    created_at { "2018-10-02 20:20:30" }
    updated_at { "2018-10-02 20:20:30" }
  end
end
