require 'rails_helper'

describe 'Transactions API' do
  it 'should return a list of all transaction items' do
    invoice_items = create_list(:transaction, 5)

    get '/api/v1/transactions'

    expect(response).to be_successful

    invoice_items_parsed = JSON.parse(response.body)
  end

  it 'returns one transaction' do
    transaction = create(:transaction)

    get "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_successful

    invoice_item_parsed = JSON.parse(response.body)

    expect(invoice_item_parsed["id"]).to eq(transaction.id)
  end
end
