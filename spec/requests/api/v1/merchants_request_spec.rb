require 'rails_helper'

RSpec.describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end

  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end

  it "can find one merchant by params" do
    name = create(:merchant).name

    get "/api/v1/merchants/find?name=#{name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(name)
  end

  # it "can find one merchant by other params" do
  #   created_at = create(:merchant).created_at
  #
  #   get "/api/v1/merchants/find?created_at=#{created_at}"
  #
  #   merchant = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(merchant["created_at"]).to eq(created_at)
  # end

  # it "can find many merchants by params" do
  #   updated_at = create(:merchant).updated_at
  #   create(:merchant)
  #
  #   get "/api/v1/merchants/find_all?updated_at=#{updated_at}"
  #
  #   merchants = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(merchants).to be_a_kind_of(Array)
  #   require 'pry'; binding.pry
  #   expect(merchants.count).to eq(2)
  #   expect(merchants[0]["updated_at"]).to eq(updated_at)
  # end

  it "can find many merchants by params" do
    name = create(:merchant).name
    create(:merchant)

    get "/api/v1/merchants/find_all?name=#{name}"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants).to be_a_kind_of(Array)
    expect(merchants.count).to eq(2)
    expect(merchants[0]["name"]).to eq(name)
  end

  it "can find a random merchant" do
    create_list(:merchant, 5)

    get "/api/v1/merchants/random"

    merchants = JSON.parse(response.body)
    random_merchant = Merchant.find(merchants["id"])

    expect(response).to be_success
    expect(random_merchant).to_not be_nil
  end
end
