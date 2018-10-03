class InvoiceItem < ApplicationRecord
  default_scope {order(:id)}

  belongs_to :item
  belongs_to :invoice
end
