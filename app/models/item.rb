class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoice_items

  def self.most_revenue(quantity)
    joins(:invoices)
      .merge(Invoice.paid)
      .group(:id)
      .order('sum(invoice_items.quantity * invoice_items.unit_price) DESC')
      .limit(quantity)
  end

  def best_day
    self.invoices
        .joins(:transactions, :invoice_items)
        .where(transactions: { result: "success" })
        .group(:id)
        .order("sum(invoice_items.quantity) DESC", created_at: :desc)
        .first
        .created_at
  end

  def self.most_items(quantity=nil)
    joins(invoices: :transactions)
      .where(invoices: { transactions: {result: "success"} })
      .order("sum(quantity) DESC")
      .group(:id)
      .limit(quantity)
  end
end
