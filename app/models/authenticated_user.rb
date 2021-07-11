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
  validate :user_must_be_authenticated

  def user
    return @user if @called

    @called = true
    @user = User.find_by(email: email)&.authenticate(password)
  end

  def user_must_be_authenticated
    return if user
    return if errors.include?(:email) || errors.include?(:password)

    errors.add :base, :not_authenticated
  end
end
