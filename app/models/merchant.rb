class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def favorite_customer
    self.customers
      .joins(:transactions)
      .where(transactions: {result: "success"})
      .group('customers.id')
      .order('count(customers.id) DESC')
      .first
  end

  def self.all_revenue_by_date(date)
    joins(:invoice_items)
    .merge(Invoice.paid)
      .where(invoices: {created_at: date})
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end
end
