class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    revenue = (Merchant.revenue_by_date(params[:date])).to_f/100
    render json: { "total_revenue": revenue.to_json }
  end

  def show
    if params[:id]
      merchant_revenue = Merchant.total_revenue_by_merchant(params[:id]).to_f/100
      render json: { "revenue": merchant_revenue.to_json}
    else
      merchant_revenue = Merchant.total_revenue_by_date_merchant(params[:date, :id]).to_f/100
      render json: { "revenue": merchant_revenue.to_json}
    end
  end
end
