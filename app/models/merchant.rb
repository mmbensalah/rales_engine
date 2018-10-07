class Merchant < ApplicationRecord
  default_scope {order(:id)}

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def self.most_revenue(quantity)
    unscoped.select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
	  .joins("INNER JOIN invoices ON invoices.merchant_id = merchants.id
            INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id")
	  .group(:id)
	  .order("revenue DESC")
    .limit(quantity)
  end

  def self.most_items(quantity)
    unscoped.select("merchants.*, SUM(invoice_items.quantity) AS total_items")
    .joins("INNER JOIN invoices ON invoices.merchant_id = merchants.id
            INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id
            INNER JOIN transactions ON transactions.invoice_id = invoices.id")
    .merge(Transaction.unscoped.successful)
    .limit(quantity)
    .group(:id)
    .order("total_items DESC")
  end

  def self.revenue_by_date(date)
    unscoped
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.unscoped.successful)
    .where(invoices: {created_at: date.to_date.beginning_of_day..date.to_date.end_of_day})
    .sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def self.total_revenue_by_merchant(id)
    unscoped
    .select("SUM(invoice_items.unit_price * invoice_items.quantity) AS total_revenue")
	  .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.unscoped.successful)
	  .group(:id)
    .find(id)
    .total_revenue
  end

  def self.total_revenue_by_date_merchant(date, id)
    unscoped
     .joins(invoices: [:invoice_items, :transactions])
     .merge(Transaction.unscoped.successful)
     .where(invoices: {created_at: date.to_date.beginning_of_day..date.to_date.end_of_day})
     .where(merchants: { id: id })
     .sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def self.favorite_customer(id)
    unscoped
      .select("customers.*, COUNT(invoices.id) AS num_invoices")
      .join(invoices: [:invoice_items, :transactions])
      .where(invoices: [merchant_id: 2])
      .merge(Transaction.unscoped.successful)
      .group(:id)
      .order("invoices.id DESC")
  end

  # SELECT customer_id, merchant_id,
  # COUNT(customer_id) AS customer_count FROM invoices
  # GROUP BY customer_id, merchant_id
  # ORDER BY merchant_id, customer_count DESC;
  #












end
