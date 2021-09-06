# frozen_string_literal: true

require 'rails_helper'
require 'support/factory_bot'

require 'support/matchers/have_item_with'
require 'support/matchers/have_json_body'
require 'support/matchers/with_size'
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
    it { is_expected.to have_json_body(transactions: with_size(1)) }

    it "includes current user's transaction" do
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
end
