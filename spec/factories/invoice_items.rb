FactoryBot.define do
  factory :invoice_item do
    item_id { 1 }
    invoice_id { 1 }
    quantity { 1 }
    unit_price { 1 }
    created_at { "2018-10-02 20:36:57" }
    updated_at { "2018-10-02 20:36:57" }
  end
end
