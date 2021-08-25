# frozen_string_literal: true

module Api
  module V1
    # Manage current user's account
    class MyProfilesController < ControllerWithAuthentication
      def show
        render json: current_user
      end

      def update
        if current_user.update(user_params)
          render json: current_user, location: api_v1_users_path
        else
          render json: current_user, status: :unprocessable_entity
        end
      end
    end
  end
end
