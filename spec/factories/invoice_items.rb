FactoryBot.define do
  factory :invoice_item do
    item_id { rand(1..2483) }
    invoice_id { rand(1..4843) }
    quantity { rand(1..100) }
    unit_price { rand(100..10000) }
    created_at { "2018-10-02 20:36:57" }
    updated_at { "2018-10-02 20:36:57" }
  end
end
