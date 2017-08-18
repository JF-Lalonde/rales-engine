class Api::V1::Items::FindController < ApplicationController

  before_action :change_unit_price

  def show
    render json: Item.where(item_params).first
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id,
    :created_at, :updated_at)
  end

  def change_unit_price
    if params[:unit_price]
      params[:unit_price].sub!('.', '').to_i
    end
  end
end
