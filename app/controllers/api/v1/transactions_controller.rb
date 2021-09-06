# frozen_string_literal: true

module Api
  module V1
    # Current user's transactions
    class TransactionsController < ControllerWithAuthentication
      def index
        render json: { transactions: current_user.transactions }
      end

      def create
        transaction = Transaction.new(transaction_params)

        if transaction.save
          render(
            json: transaction,
            status: :created,
            location: api_v1_transaction_path(transaction)
          )
        else
          render json: transaction, status: :unprocessable_entity
        end
      end

      private

      def transaction_params
        params.require(:transaction).permit(
          :category_id, :amount_cents, :amount_currency, :note
        ).merge(user: current_user)
      end
    end
  end
end
