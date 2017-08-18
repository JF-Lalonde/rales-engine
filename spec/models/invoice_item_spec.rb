require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should belong_to(:invoice) }
  it { should belong_to(:item) }
  it { should have_db_column(:id) }
  it { should have_db_column(:item_id) }
  it { should have_db_column(:invoice_id) }
  it { should have_db_column(:quantity) }
  it { should have_db_column(:unit_price) }
end
