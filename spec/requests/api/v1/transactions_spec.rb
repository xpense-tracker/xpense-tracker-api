# frozen_string_literal: true

require 'rails_helper'
require 'support/factory_bot'

require 'support/matchers/have_item_with'
require 'support/matchers/have_json_body'
require 'support/matchers/with_size'
require 'support/shared_contexts/when_user_signed_in'

RSpec.describe 'Api::V1::Transactions' do
  describe 'GET /index' do
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
    it { is_expected.to have_json_body(transactions: with_size(1)) }

    it "includes current users' transaction" do
      expect(http_response).to have_json_body(
        transactions: have_item_with(amount_cents: 1_00)
      )
    end

    it "does not include other users' transactions" do
      expect(http_response).to have_json_body(
        transactions: have_no_item_with(amount_cents: 2_00)
      )
    end
  end

  describe 'POST /index' do
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
      let!(:category) { create(:category) }

      it { is_expected.to have_http_status(:created) }
      it { is_expected.to have_json_body(expected_response) }
    end
  end
end
