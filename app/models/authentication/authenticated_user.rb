# frozen_string_literal: true

module Authentication
  # Authenticates a user and provides their ID
  class AuthenticatedUser < ApplicationModel
    def initialize(credentials)
      super()
      @email = credentials[:email]
      @password = credentials[:password]
      @to_model = nil
    end

    delegate :id, to: :user

    attr_reader :email, :password

    validates :email, presence: true
    validates :password, presence: true
    validates_with UserMustBeAuthenticated

    def to_model
      @to_model ||= User.find_by(email: email)&.authenticate(password) ||
                    Authentication::NullUser.new
    end
    alias user to_model
  end
end
