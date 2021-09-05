# frozen_string_literal: true

# Money transfer (expense)
class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category

  monetize :amount_cents
end
