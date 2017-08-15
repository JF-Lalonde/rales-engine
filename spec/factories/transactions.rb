FactoryGirl.define do
  factory :transaction do
    credit_card_number "8675309"
    credit_card_expiration_date Date.today
    result "Good"
    invoice
  end
end
