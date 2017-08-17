class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  has_many :transactions, through: :invoice

  def self.total
    joins(:transactions)
      .merge(Transaction.successful)
      .sum('quantity * unit_price')
  end
end
