FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status { "shipped" }
    created_at { "2018-10-02 20:25:43" }
    updated_at { "2018-10-02 20:25:43" }
  end
end
