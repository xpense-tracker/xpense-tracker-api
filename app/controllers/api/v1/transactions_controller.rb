# frozen_string_literal: true

module Api
  module V1
    # Current user's transactions
    class TransactionsController < ControllerWithAuthentication
      def index
        render json: { transactions: current_user.transactions }
      end

      def create
        render json: {}
      end
    end
  end
end
