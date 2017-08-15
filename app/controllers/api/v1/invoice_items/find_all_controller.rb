class Api::V1::InvoiceItems::FindAllController < ApplicationController

  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  private

  def invoice_item_params
    params.require(:invoice_items).permit(:id, :item_id, :invoice_id, :quantity, :unit_price)
  end
end
