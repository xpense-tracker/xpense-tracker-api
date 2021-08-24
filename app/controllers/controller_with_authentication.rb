# frozen_string_literal: true

# Provides authentication to derived controllers.
# User is exposed via current_user method.
class ControllerWithAuthentication < ApplicationController
  rescue_from(
    Authentication::JwtCodec::InvalidTokenError,
    Http::BearerTokenFromHeaders::MissingToken,
    Http::BearerTokenFromHeaders::UnsupportedType,
    with: :unauthenticated
  )

  def current_user
    @current_user ||= Authentication::UserById.new(
      Authentication::IdFromJwt.new(
        Http::BearerTokenFromHeaders.new(
          request.headers
        )
      )
    ).to_model
  end

  private

  def unauthenticated(error)
    render json: { error: error.message }, status: :unauthorized
  end
end
