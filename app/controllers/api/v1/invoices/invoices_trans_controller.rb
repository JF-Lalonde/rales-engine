class Api::V1::Invoices::InvoicesTransController < ApplicationController

  def show
    render json: Invoice.find(params[:id]).transactions
  end
end
