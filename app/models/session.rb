# frozen_string_literal: true

# Contains a token to identify a user
class Session < ApplicationModel
  def initialize(user, jwt_codec)
    super()
    @user = user
    @jwt_codec = jwt_codec
  end

  delegate :valid?, :invalid?, :validate, :errors, to: :user

  def access_token
    @jwt_codec.encode({ id: @user.id })
  end

  private

  def user
    @user ||= User.find_by(email: @email)&.authenticate(@password)
  end

  def user_must_be_authenticated
    errors.add :base, :authenticated if user.blank?
  end
end
