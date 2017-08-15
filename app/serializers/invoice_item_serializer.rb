class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :quantity, :unit_price
end
