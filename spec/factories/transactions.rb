FactoryGirl.define do
  factory :transaction do
    association :customer, factory: :customer
    association :merchant, factory: :merchant
  end
end
