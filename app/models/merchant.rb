class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  def total_revenue
    self.invoices
        .joins(:transactions, :invoice_items)
        .where(transactions:{result: "success"})
        .sum("unit_price * quantity")
  end

  def revenue_by_date(date=nil)
    self.invoices
        .joins(:transactions, :invoice_items)
        .where(transactions:{result: "success"})
        .where(created_at: date)
        .sum("unit_price * quantity")
  end

  def self.most_items(quantity=nil)
    select('merchants.*, sum(invoice_items.quantity) AS number_of_items')
      .joins(invoices: [:transactions, :invoice_items])
      .where(transactions: {result: "success"})
      .group(:id)
      .order("number_of_items DESC")
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
