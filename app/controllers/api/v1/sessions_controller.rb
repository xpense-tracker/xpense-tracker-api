# frozen_string_literal: true

module Api
  module V1
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
        params.require(:session).permit(:email, :password)
      end
    end
  end
end
