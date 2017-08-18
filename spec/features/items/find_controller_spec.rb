require 'rails_helper'

describe "Find Controller", type: :request do
  it "shows single item by query params" do
    item = create(:item)

    get "/api/v1/items/find?id=#{item.id}"

    response_body = JSON.parse(response.body)
    expect(response).to be_success
    response_body.each do |key, value|
      if item[key].class == Integer && item[key].to_s.length > 5
        expect(value.to_f * 100).to eq(item[key])
      else
        expect(value).to eq(item[key])
      end
    end
  end
end
