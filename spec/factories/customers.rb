FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    created_at { "2018-10-02 19:21:50" }
    updated_at { "2018-10-02 19:21:50" }
  end
end
