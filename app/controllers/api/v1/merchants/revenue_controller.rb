class Api::V1::Merchants::RevenueController < ApplicationController
  def show

  end

  def index
    render json: Merchant.all_revenue_by_date(params[:date])
  end
end
