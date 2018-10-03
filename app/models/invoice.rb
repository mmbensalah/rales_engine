class Invoice < ApplicationRecord
  default_scope { order(:id) }

  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def self.most_expensive(limit = 5)
    unscoped.select("invoices.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    .joins(:invoice_items, :transactions)
    .merge(Transaction.unscoped.successful)
    .group(:id)
    .order("revenue DESC")
  end
end
