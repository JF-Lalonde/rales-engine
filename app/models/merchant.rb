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

  def favorite_customer
    self.customers
      .joins(:transactions)
      .where(transactions: {result: "success"})
      .group('customers.id')
      .order('count(customers.id) DESC')
      .first
  end
end
