class Api::V1::Items::FindController < ApplicationController

  def show
    render json: Item.where(item_params).first
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id,
    :created_at, :updated_at)
  end

end
