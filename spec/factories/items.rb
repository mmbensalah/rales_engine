FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyString" }
    unit_price { 1 }
    merchant_id { 1 }
    created_at { "2018-10-02 20:20:30" }
    updated_at { "2018-10-02 20:20:30" }
  end
end
