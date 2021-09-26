# frozen_string_literal: true

# Serializes Transaction with its category
class DetailedTransactionSerializer < TransactionSerializer
  has_one :category
end
