class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  has_many :transactions, through: :invoice

  def total
    sum(self.quantity * self.unit_price)
  end

end
