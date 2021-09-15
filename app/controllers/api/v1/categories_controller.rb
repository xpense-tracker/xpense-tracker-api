# frozen_string_literal: true

module Api
  module V1
    # List categories available for current user, manage categories
    class CategoriesController < ControllerWithAuthorization
      def index
        authorize!
        render json: authorized_scope(Category.all)
      end
    end
  end
end
