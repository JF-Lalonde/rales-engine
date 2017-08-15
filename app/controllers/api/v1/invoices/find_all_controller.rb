class Api::V1::Invoices::FindAllController < ApplicationController

  def index
    render json: Invoice.where(invoice_params)
  end

  private

  def invoice_params
    params.permit(:id, :customer_id, :merhcant_id, :status, :created_at, :updated_at)
  end
end
