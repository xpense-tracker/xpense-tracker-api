# frozen_string_literal: true

# Money transfer (expense)
class Transaction < ApplicationRecord
  belongs_to :user

  monetize :amount_cents
end
