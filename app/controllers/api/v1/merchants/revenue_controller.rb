class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: Merchant.find(params[:id]).total_revenue(filter)
  end

  private

  def filter
    {}
  end
end
