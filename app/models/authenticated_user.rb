# frozen_string_literal: true

# Authenticates a user and provides their ID
class AuthenticatedUser < ApplicationModel
  def initialize(credentials)
    super()
    @email = credentials[:email]
    @password = credentials[:password]
  end

  attr_reader :email, :password

  delegate :id, to: :user

  validates :email, presence: true
  validates :password, presence: true
  validates_with UserMustBeAuthenticated

  def to_model
    @to_model ||= User.find_by!(email: email).authenticate(password)
  end
  alias user to_model
end
