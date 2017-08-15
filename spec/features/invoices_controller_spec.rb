require 'rails_helper'

describe "Invoices Controller", type: :request do
  it "shows all invoices" do
    create_list(:invoice, 3)

    get "/api/v1/invoices"

    expect(response).to be_success
    expect(JSON.parse(response.body).count).to eq(3)
  end

  it "shows one invoice by id" do
    id = create(:invoice).id

    get "/api/v1/invoices"

    expect(response).to be_success
    expect(JSON.parse(response.body).count).to eq(1)
  end

end
