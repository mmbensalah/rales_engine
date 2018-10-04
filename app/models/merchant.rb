class Merchant < ApplicationRecord
  default_scope {order(:id)}

  has_many :items
  has_many :invoices

  def self.top_merchants(number)
    unscoped.select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
	  .joins("INNER JOIN invoices ON invoices.merchant_id = merchants.id
            INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id")
	  .limit(number)
	  .group(:id)
	  .order("revenue DESC")
  end

  def self.top_merchants_by_items(number)
    unscoped.select("merchants.*, SUM(invoice_items.quantity) AS total_items")
	  .joins("INNER JOIN invoices ON invoices.merchant_id = merchants.id
		        INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id")
	  .limit(number)
	  .group(:id)
	  .order("total_items DESC")
  end

  def self.revenue_by_date(date)
    Merchant.unscoped
    .select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS days_revenue")
    .joins("INNER JOIN invoices ON invoices.merchant_id = merchants.id
            INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id")
    .where("invoice_items.created_at between 'date' and 'date 23:59:59'")
    .group(:id)
    .order("days_revenue DESC")
  end




end
