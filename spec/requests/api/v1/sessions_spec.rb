# frozen_string_literal: true

require 'rails_helper'
require 'support/factory_bot'
require 'support/matchers/have_json_body'

RSpec.describe 'Api::V1::Sessions' do
  describe 'POST /api/v1/sessions' do
    subject(:http_response) do
      post api_v1_sessions_path, params: { session: session_params }
      response
    end

    let(:session_params) { { email: 'user@example.org', password: '123456' } }

    context 'when account with given credentials exists' do
      before { create(:user, session_params) }

      it { is_expected.to have_http_status(:ok) }
      it { is_expected.to have_json_body(session: have_key(:token)) }
    end

    context 'when email or password are wrong' do
      it { is_expected.to have_http_status(:unauthorized) }
      it { is_expected.to have_json_body(session: have_key(:errors)) }
    end
  end
end
