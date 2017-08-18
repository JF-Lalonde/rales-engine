class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    if params[:date]
      render json: Merchant.find(params[:id]).revenue_by_date(params[:date]), serializer: RevenueSerializer
    else
      render json: Merchant.find(params[:id]).total_revenue, serializer: RevenueSerializer
    end
  end

  def index
    render json: Merchant.all_revenue_by_date(params[:date]), serializer: TotalRevenueSerializer
  end
end
