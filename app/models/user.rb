# frozen_string_literal: true

# Represents a human account in the app
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password

  has_many :transactions, dependent: :destroy
  has_many :categories, dependent: :destroy
end
