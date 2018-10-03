require 'rails_helper'

describe 'Customers API' do
  it 'should return a list of all customers' do
    customer_list = create_list(:customer, 5)

    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(5)
  end

  it 'should return one customer' do
    customer = create(:customer)

    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_successful

    customer_parsed = JSON.parse(response.body)

    expect(customer_parsed["first_name"]).to eq(customer.first_name)
  end
end
