# frozen_string_literal: true

# Authenticates a user and provides their ID
class AuthenticatedUser < ApplicationModel
  def initialize(credentials)
    super
    @email = credentials[:email]
    @password = credentials[:password]
  end

  delegate :id, to: :user

  attr_accessor :email, :password

  validates :email, presence: true
  validates :password, presence: true
  validates_with UserMustBeAuthenticated

  def user
    return @user if @called

    @called = true
    @user = User.find_by(email: email)&.authenticate(password)
  end
end
