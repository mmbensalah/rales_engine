FactoryBot.define do
  factory :merchant do
    name { Faker::Name.name }
    created_at { "2018-10-02 19:21:50" }
    updated_at { "2018-10-02 19:21:50" }
  end
end
