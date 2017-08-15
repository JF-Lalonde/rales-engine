class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price

  def unit_price
    object.unit_price.insert(-3, ".")
  end
end
