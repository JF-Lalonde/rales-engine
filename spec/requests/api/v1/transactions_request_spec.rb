require 'rails_helper'

RSpec.describe "Transactions API" do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it "can get one transaction by its id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end

  it "can find one transaction by params" do
    credit_card_number = create(:transaction).credit_card_number

    get "/api/v1/transactions/find?credit_card_number=#{credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["credit_card_number"]).to eq(credit_card_number)
  end

  it "can find one transaction by other params" do
    created_at = create(:transaction).created_at

    get "/api/v1/transactions/find?created_at=#{created_at}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["created_at"]).to eq(created_at)
  end

  it "can find many transactions by params" do
    updated_at = create(:transaction).updated_at
    create(:transaction)

    get "/api/v1/transactions/find_all?updated_at=#{updated_at}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions).to be_a_kind_of(Array)
    expect(transactions.count).to eq(2)
    expect(transactions[0]["updated_at"]).to eq(updated_at)
  end

  it "can find many transactions by params" do
    result = create(:transaction).result
    create(:transaction)

    get "/api/v1/transactions/find_all?result=#{result}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions).to be_a_kind_of(Array)
    expect(transactions.count).to eq(2)
    expect(transactions[0]["result"]).to eq(result)
  end

  it "can find a random transaction" do
    create_list(:transaction, 5)

    get "/api/v1/transactions/random"

    transactions = JSON.parse(response.body)
    random_transaction = Transaction.find(transactions["id"])

    expect(response).to be_success
    expect(random_transaction).to_not be_nil
  end
end
