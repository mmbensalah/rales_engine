class Transaction < ApplicationRecord
  default_scope {order(:id)}

  scope :successful, -> { where(result: "success") }
  
  belongs_to :invoice
end
