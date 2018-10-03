FactoryBot.define do
  factory :invoice do
    customer_id { 1 }
    merchant_id { 1 }
    status { "MyString" }
    created_at { "2018-10-02 20:25:43" }
    updated_at { "2018-10-02 20:25:43" }
  end
end
