# frozen_string_literal: true

module Api
  # Authenticates users
  class SessionsController < ApplicationController
    def create
      session = Session.new(session_params)

      if session.valid?
        render json: session
      else
        render json: session, status: :unauthorized
      end
    end

    private

    def session_params
      params.require(:session).permit(:email, :password)
    end
  end
end
