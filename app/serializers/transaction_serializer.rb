# frozen_string_literal: true

# Serializes Transaction
class TransactionSerializer < ApplicationSerializer
  type 'transaction'

  attributes :id

  has_one :amount do
    MoneySerializer::Money.new(object.amount)
  end
end
