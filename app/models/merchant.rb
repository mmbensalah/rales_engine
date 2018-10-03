class Merchant < ApplicationRecord
  default_scope {order(:id)}

  has_many :items
  has_many :invoices
end
