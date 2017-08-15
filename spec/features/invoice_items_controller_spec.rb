require 'rails_helper'

describe "Invoice Items Controller", type: :request do
  it "shows all invoice items" do
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items"

    expect(response).to be_success
    expect(JSON.parse(response.body).count).to eq(3)

  end

  it "shows one invoice item by id" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items"

    expect(response).to be_success
    expect(JSON.parse(response.body).count).to eq(1)

  end
end
