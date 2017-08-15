require 'rails_helper'

describe "Items Controller", type: :request do
  it "shows all items" do
    create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_success
    expect(JSON.parse(response.body).count).to eq(3)
  end

  it "shows one item by id" do
    id = create(:item).id

    get "/api/v1/items"

    expect(response).to be_success
    expect(JSON.parse(response.body).count).to eq(1)
  end

end
