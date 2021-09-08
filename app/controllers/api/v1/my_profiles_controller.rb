# frozen_string_literal: true

module Api
  module V1
    # Manage current user's account
    class MyProfilesController < ControllerWithAuthentication
      def show
        render json: current_user, location: api_v1_my_profile_path
      end

      def update
        if current_user.update(profile_params)
          render json: current_user, location: api_v1_my_profile_path
        else
          render json: current_user, status: :unprocessable_entity
        end
      end

      private

      def profile_params
        params.require(:user).permit(:email, :name, :password)
      end
    end
  end
end
