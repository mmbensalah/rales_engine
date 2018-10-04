FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    quantity { rand(1..100) }
    unit_price { rand(100..10000) }
    created_at { "2018-10-02 20:36:57" }
    updated_at { "2018-10-02 20:36:57" }
  end
end
