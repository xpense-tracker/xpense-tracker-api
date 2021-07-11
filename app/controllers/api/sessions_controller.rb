# frozen_string_literal: true

module Api
  # Authenticates users
  class SessionsController < ApplicationController
    def create
      session = Session.new(
        AuthenticatedUser.new(credentials),
        JwtCodec.new
      )

      if session.valid?
        render json: session
      else
        render json: session, status: :unauthorized
      end
    end

    private

    def credentials
      params.require(:user).permit(:email, :password)
    end
  end
end
