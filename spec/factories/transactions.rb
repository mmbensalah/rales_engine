FactoryBot.define do
  factory :transaction do
    invoice_id { 1 }
    credit_card_number { 1 }
    credit_card_expiration_date { "2018-10-02" }
    result { "MyString" }
    created_at { "2018-10-02 20:59:44" }
    updated_at { "2018-10-02 20:59:44" }
  end
end
