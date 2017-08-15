require 'rails_helper'

describe "Random Controller", type: :request do
  it "shows random invoice" do
    create_list(:invoice, 5)

    get "/api/v1/invoices/random"
    response_body = JSON.parse(response.body)
    invoice = Invoice.find(response_body["id"])
    expect(response).to be_success
    expect(invoice).to_not eq(nil)

  end
end
