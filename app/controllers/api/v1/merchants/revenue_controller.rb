class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: Merchant.find(params[:id]).total_revenue(filter), serializer: RevenueSerializer
  end

  def index
    render json: Merchant.all_revenue_by_date(params[:date]), serializer: TotalRevenueSerializer
  end

  private

  def filter
    if params.keys.include? "date"
      "invoices.created_at #{params[:date]}"
    else
      nil
    end
  end
end
