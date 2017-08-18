class Api::V1::Items::FindController < ApplicationController

    if params[:unit_price]
      render json: Item.find_by(params[:unit_price].sub!('.', '').to_i)
    else
      render json: Item.where(item_params).first
    end
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id,
    :created_at, :updated_at)
  end
end
