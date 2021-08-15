# frozen_string_literal: true

# Creates table for transaction with all required fields
class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :category, null: false, foreign_key: true, type: :uuid
      t.monetize :amount
      t.text :note

      t.timestamps
    end
  end
end
