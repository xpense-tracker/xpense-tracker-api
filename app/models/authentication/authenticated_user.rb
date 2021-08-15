# frozen_string_literal: true

module Authentication
  # Authenticates a user and provides their ID
  class AuthenticatedUser < ApplicationModel
    def initialize(credentials)
      super()
      @email = credentials[:email]
      @password = credentials[:password]
      @called = false
      @user = nil
    end

    delegate :id, to: :user

    attr_reader :email, :password

    validates :email, presence: true
    validates :password, presence: true
    validates_with UserMustBeAuthenticated

    def user
      return @user if @called

      @called = true
      @user = User.find_by(email: email)&.authenticate(password)
    end
    alias to_model user
  end
end
