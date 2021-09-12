# frozen_string_literal: true

module Api
  module V1
    # Authenticates users
    class SessionsController < ApplicationController
      def create
        session = Authentication::Session.new(
          Authentication::JwtFromUser.new(
            Authentication::AuthenticatedUser.new(credentials)
          )
        )

        if session.valid?
          render json: session, root: :session
        else
          render json: session, root: :session, status: :unauthorized
        end
      end

      private

      def credentials
        params.require(:session).permit(:email, :password)
      end
    end
  end
end
