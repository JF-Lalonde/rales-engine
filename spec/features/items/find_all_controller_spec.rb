require 'rails_helper'

describe "Find All Controller", type: :request do
  it "shows single item by query params" do
    items = create_list(:item, 3)
    item = items.last

    get "/api/v1/items/find_all?id=#{item.id}"

    response_body = JSON.parse(response.body)
    expect(response).to be_success
    response_body.each do |key, value|
      expect(value).to eq(item[key])
    end
  end
end
