class  Api::V1::Items::BestController < ApplicationController
  def show
    render json: Item.find(params[:id]).best_day
  end
end
