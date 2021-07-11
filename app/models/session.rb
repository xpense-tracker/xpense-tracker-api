# frozen_string_literal: true

# Contains a token to identify users
class Session
  include ActiveModel::Validations
  include ActiveModel::Serialization

  def initialize(session_params, jwt_codec = JwtCodec.new)
    @email = session_params[:email]
    @password = session_params[:password]
    @jwt_codec = jwt_codec
  end

  validates :email, presence: true
  validates :password, presence: true
  validate :user_must_be_authenticated

  def token
    @jwt_codec.encode({ id: user.id })
  end

  private

  attr_reader :email, :password

  def user
    @user ||= User.find_by(email: @email)&.authenticate(@password)
  end

  def user_must_be_authenticated
    errors.add :base, :authenticated if user.blank?
  end
end
