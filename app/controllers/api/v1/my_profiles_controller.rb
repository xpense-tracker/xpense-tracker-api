# frozen_string_literal: true

module Api
  module V1
    # Manage current user's account
    class MyProfilesController < ControllerWithAuthentication
      def show
        render json: current_user
      end
    end
  end
end
