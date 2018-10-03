require 'rails_helper'

describe 'Merchants API' do
  it 'sends a list of merchants' do
    create_list(:merchant, 5)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(5)
  end

  it 'shows one merchant' do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"

    merchant_1 = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant_1["id"]).to eq(merchant.id)
  end
end
