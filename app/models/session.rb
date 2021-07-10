# frozen_string_literal: true

# Contains a token to identify users
class Session
  include ActiveModel::Validations
  include ActiveModel::Serialization

  def initialize(session_params)
    @email = session_params[:email]
    @password = session_params[:password]
  end

  validates :email, presence: true
  validates :password, presence: true
  validate :authenticated

  def token
    JwtCodec.new.encode({ id: user.id })
  end

  private

  attr_reader :email, :password

  def user
    @user ||= User.find_by(email: @email)&.authenticate(@password)
  end

  def authenticated
    errors.add :base, :authenticated unless user.present?
  end
end
