# frozen_string_literal: true

# Provides authentication to derived controllers.
# User is exposed via current_user method.
class AuthenticatedController < ApplicationController
  before_action :authorize_user!

  def current_user
    @current_user ||= Authentication::UserById.new(
      Authentication::IdFromJwt.new(
        Http::BearerTokenFromHeaders.new(
          request.headers
        )
      )
    ).to_model
  end

  rescue_from Authentication::JwtCodec::InvalidTokenError, with: :not_authorized
  rescue_from Http::BearerTokenFromHeaders::MissingToken, with: :not_authorized
  rescue_from Http::BearerTokenFromHeaders::UnsupportedType,
              with: :not_authorized

  def authorize_user!
    current_user
  end

  def not_authorized(error)
    render json: { error: error }, status: :unauthorized
  end
end
