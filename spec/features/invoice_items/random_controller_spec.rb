require 'rails_helper'

describe "Random Controller", type: :request do
  it "shows random invoice item" do
    create_list(:invoice_item, 5)

    get "/api/v1/invoice_items/random"
    response_body = JSON.parse(response.body)
    invoice_item = InvoiceItem.find(response_body["id"])
    expect(response).to be_success
    expect(invoice_item).to_not eq(nil)

  end
end
