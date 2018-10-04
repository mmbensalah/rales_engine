require 'rails_helper'

describe 'InvoiceItems API' do
  it 'should return a list of all invoice items' do
    invoice_items = create_list(:invoice_item, 5)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    invoice_items_parsed = JSON.parse(response.body)
  end

  it 'returns one invoice_item' do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}"

    expect(response).to be_successful

    invoice_item_parsed = JSON.parse(response.body)

    expect(invoice_item_parsed["id"]).to eq(invoice_item.id)
  end
end
