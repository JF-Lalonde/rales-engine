class Api::V1::InvoiceItems::FindController < ApplicationController

  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

  private

  def invoice_item_params
    params.require(:invoice_items).permit(:id, :item_id, :invoice_id, :quantity, :unit_price)
  end

end
