# frozen_string_literal: true

module Api
  module V1
    # Manages users
    class UsersController < AuthenticatedController
      def show
        render json: current_user
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: user, status: :created, location: api_v1_users_path
        else
          render json: user, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :name, :password)
      end
    end
  end
end
