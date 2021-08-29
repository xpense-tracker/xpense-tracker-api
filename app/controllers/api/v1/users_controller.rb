# frozen_string_literal: true

module Api
  module V1
    # Register users
    class UsersController < ApplicationController
      def create
        user = User.new(user_params)

        if user.save
          render json: user, status: :created, location: api_v1_users_path
        else
          render json: user, status: :unprocessable_entity
        end
      end

      def update
        if current_user.update(user_params)
          render json: current_user, location: api_v1_users_path
        else
          render json: current_user, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :name, :password)
      end
    end
  end
end
