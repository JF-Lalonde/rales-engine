require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { should belong_to(:customer) }
  it { should belong_to(:merchant) }
  it { should have_many(:transactions) }
  it { should have_many(:invoice_items) }
  it { should have_db_column(:id) }
  it { should have_db_column(:customer_id) }
  it { should have_db_column(:merchant_id) }
  it { should have_db_column(:status) }
end
