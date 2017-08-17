class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    self.merchants
        .joins(:transactions)
        .where(transactions: { result: "success" })
        .order("transactions DESC")
        .first
  end
end
