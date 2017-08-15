FactoryGirl.define do
  factory :invoice_item do
    association :item, factory: :item
    association :invoice, factory: :invoice
    quantity "MyString"
    unit_price "MyString"
  end
end
