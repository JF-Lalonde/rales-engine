require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should have_many(:invoices) }
  it { should have_many(:items) }
  it { should have_db_column(:id) }
  it { should have_db_column(:name) }
end
