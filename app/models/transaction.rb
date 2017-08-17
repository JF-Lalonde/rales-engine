class Transaction < ApplicationRecord
  belongs_to :invoice

  scope :successful, -> { where(result: "success") }
  scope :failiure, -> { where(result: "failed") }
end
