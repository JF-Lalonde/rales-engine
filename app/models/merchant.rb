class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  def total_revenue(filter=nil)
    self.invoices
        .joins(:transactions, :invoice_items)
        .where(transactions:{result: "success"})
        .sum("unit_price * quantity")
        .where(filter)
  end

  def self.most_items(quantity=nil)
    joins(:transactions, :invoice_items)
      .where(transactions: {result: "success"})
      .order("sum(quantity) DESC")
      .group(:id)
      .limit(quantity)
  end

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
