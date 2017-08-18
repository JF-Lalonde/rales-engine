FactoryGirl.define do
  factory :item do
    name "MyString"
    description "MyText"
    unit_price 234523
    association :merchant, factory: :merchant
  end
end
