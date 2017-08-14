class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :model, foreign_key: true
      t.references :merchant, foreign_key: true
      t.integer :invoice_id
      t.integer :credit_card_number
      t.datetime :credit_card_expiration_date
      t.string :result

      t.timestamps
    end
  end
end
