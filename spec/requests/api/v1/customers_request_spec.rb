require 'rails_helper'

RSpec.describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can find one customer by params" do
    first_name = create(:customer).first_name

    get "/api/v1/customers/find?first_name=#{first_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq(first_name)
  end

  it "can find one customer by other params" do
    last_name = create(:customer).last_name

    get "/api/v1/customers/find?last_name=#{last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["last_name"]).to eq(last_name)
  end

  it "can find one customer by other params" do
    id = create(:customer).id

    get "/api/v1/customers/find?id=#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can find many customers by params" do
    last_name = create(:customer).last_name
    create(:customer)

    get "/api/v1/customers/find_all?last_name=#{last_name}"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers).to be_a_kind_of(Array)
    expect(customers.count).to eq(2)
    expect(customers[0]["last_name"]).to eq(last_name)
  end

  it "can find many customers by params" do
    first_name = create(:customer).first_name
    create(:customer)

    get "/api/v1/customers/find_all?first_name=#{first_name}"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers).to be_a_kind_of(Array)
    expect(customers.count).to eq(2)
    expect(customers[0]["first_name"]).to eq(first_name)
  end

  it "can find a random customer" do
    create_list(:customer, 5)

    get "/api/v1/customers/random"

    customers = JSON.parse(response.body)
    random_customer = Customer.find(customers["id"])

    expect(response).to be_success
    expect(random_customer).to_not be_nil
  end
end
