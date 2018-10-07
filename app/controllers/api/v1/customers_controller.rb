class Api::V1::CustomersController < ApplicationController

  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find(params[:id])
  end

  def create
    render json: Customer.create(customer_params)
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name)
  end

end
