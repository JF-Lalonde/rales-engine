class Api::V1::Invoices::FindController < ApplicationController

  def show
    render json: Invoice.find_by(invoice_params)
  end

  private

  def invoice_params
    params.permit(:id, :customer_id, :merhcant_id, :status)
  end

end
