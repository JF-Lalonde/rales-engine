class Transaction < ApplicationRecord
  belongs_to :model
  belongs_to :merchant
end
