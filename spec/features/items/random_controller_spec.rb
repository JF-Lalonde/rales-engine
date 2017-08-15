require 'rails_helper'

describe "Random Controller", type: :request do
  it "shows random item" do
    create_list(:item, 5)

    get "/api/v1/items/random"
    response_body = JSON.parse(response.body)
    item = Item.find(response_body["id"])
    expect(response).to be_success
    expect(item).to_not eq(nil)

  end
end
