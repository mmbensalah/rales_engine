class Customer < ApplicationRecord
  default_scope {order(:id)}
  has_many :invoices

end
