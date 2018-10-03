require 'rails_helper'

describe 'Items API' do
  it 'should return a list of all items' do
    items = create_list(:item, 5)

    get '/api/v1/items'

    expect(response).to be_successful

    items_1 = JSON.parse(response.body)

    expect(items_1.count).to eq(5)
  end

  it 'should return one item' do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    expect(response).to be_successful

    item_parsed = JSON.parse(response.body)

    expect(item_parsed["description"]).to eq(item.description)
  end
end
