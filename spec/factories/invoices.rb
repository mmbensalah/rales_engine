FactoryBot.define do
  factory :invoice do
    customer_id { rand(1..1000) }
    merchant_id { rand(1..100) }
    status { "shipped" }
    created_at { "2018-10-02 20:25:43" }
    updated_at { "2018-10-02 20:25:43" }
  end
end
