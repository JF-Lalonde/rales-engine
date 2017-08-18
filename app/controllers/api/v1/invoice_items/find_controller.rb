class Api::V1::InvoiceItems::FindController < ApplicationController

  before_action :change_unit_price

  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

  private

  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end

  def change_unit_price
    if params[:unit_price]
      params[:unit_price].sub!('.', '').to_i
    end
  end
end
