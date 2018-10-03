require 'rails_helper'

describe 'Invoices API' do
  it 'sends a list of invoices' do
    invoices = create_list(:invoice, 5)

    get '/api/v1/invoices'

    expect(response).to be_successful

    invoices_parsed = JSON.parse(response.body)

    expect(invoices_parsed.count).to eq(5)
  end

  it 'returns one invoice' do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice.id}"

    expect(response).to be_successful

    invoice_parsed = JSON.parse(response.body)

    expect(invoice_parsed["id"]).to eq(invoice.id)
  end
end
