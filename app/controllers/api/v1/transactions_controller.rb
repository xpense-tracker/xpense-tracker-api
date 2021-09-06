# frozen_string_literal: true

module Api
  module V1
    # Current user's transactions
    class TransactionsController < ControllerWithAuthentication
      def index
        render json: { transactions: current_user.transactions }
      end
    end
  end
end
