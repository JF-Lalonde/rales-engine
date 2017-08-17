class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  scope :paid, -> { joins(:transactions).merge(Transaction.successful) }

  def self.total_revenue
    joins(:invoice_items)
      .merge(Invoice.paid)
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end
end
