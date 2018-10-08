class Customer < ApplicationRecord
  default_scope {order(:id)}
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.favorite_merchant(customer_id)
    Merchant.select("merchants.*, COUNT(invoices.id) AS invoice_total")
    .joins(invoices: [:transactions])
    .merge(Transaction.unscoped.successful)
    .where(invoices: { customer_id: customer_id })
    .group(:id)
    .order("invoice_total DESC")
    .limit(1)
    .first
  end
end
