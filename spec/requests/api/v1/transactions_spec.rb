# frozen_string_literal: true

require 'rails_helper'
require 'support/factory_bot'

require 'support/matchers/have_json_body'
require 'support/shared_contexts/when_user_signed_in'

RSpec.describe 'Api::V1::Transactions' do
  describe 'GET /api/v1/transactions' do
    subject(:http_response) do
      get api_v1_transactions_path
      response
    end

    include_context 'when user signed in'

    before do
      create(:transaction, user: current_user, amount: Money.new(1_00, 'USD'))
      create(:transaction, amount: Money.new(2_00, 'USD'))
    end

    it { is_expected.to have_http_status(:ok) }

    it "includes only current user's transaction" do
      expect(http_response).to have_json_body(
        transactions: [include(amount_cents: 1_00)]
      )
    end
  end

  describe 'POST /api/v1/transactions' do
    subject(:http_response) do
      post api_v1_transactions_path, params: { transaction: params }
      response
    end

    include_context 'when user signed in'

    context 'with valid data' do
      let(:params) do
        {
          amount_cents: 1_00,
          amount_currency: 'USD',
          category_id: category.id
        }
      end
      let(:expected_response) do
        {
          transaction: {
            amount: {
              cents: 1_00,
              currency_iso: 'USD'
            }
          }
        }
      end
      let(:category) { create(:category) }

      it { is_expected.to have_http_status(:created) }
      it { is_expected.to have_json_body(expected_response) }
    end
  end

  describe 'DELETE /api/v1/transactions/:id' do
    subject(:http_response) do
      delete api_v1_transaction_path(transaction)
      response
    end

    include_context 'when user signed in'

    let(:transaction) { create(:transaction, user: current_user) }

    it { is_expected.to have_http_status(:no_content) }
  end
end
