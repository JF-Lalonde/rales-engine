class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_customer
    self.customers
      .joins(:transactions)
      .where(transactions: {result: "success"})
      .group('customers.id')
      .order('count(customers.id) DESC')
      .first
  end
end
