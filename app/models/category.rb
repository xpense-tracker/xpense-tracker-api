# frozen_string_literal: true

# Category of transactions
class Category < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :title, uniqueness: { scope: :user_id }
end
