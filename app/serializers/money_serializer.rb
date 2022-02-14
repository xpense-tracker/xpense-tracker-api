# frozen_string_literal: true

# Serializes Transaction
class MoneySerializer < ApplicationSerializer
  type 'money'

  attributes :cents
  attribute :currency do
    object.currency.to_s
  end

  # class to make Money serializable
  class Money
    delegate :cents, :currency, to: :@money

    def initialize(money)
      @money = money
    end

    def read_attribute_for_serialization(attribute)
      @money.send(attribute)
    end

    def self.model_name
      ActiveModel::Name.new(::Money)
    end
  end
end
