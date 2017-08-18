FactoryGirl.define do
  factory :invoice_item do
    association :item, factory: :item
    association :invoice, factory: :invoice
    quantity 345
    unit_price 234523
  end
end
