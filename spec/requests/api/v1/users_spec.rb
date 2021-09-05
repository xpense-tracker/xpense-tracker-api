# frozen_string_literal: true

require 'rails_helper'
require 'support/factory_bot'
require 'support/matchers/have_json_body'

RSpec.describe 'Api::V1::Users' do
  describe 'POST /api/v1/users' do
    subject(:http_response) do
      post api_v1_users_path, params: { user: user_params }
      response
    end

    context 'with valid data' do
      let(:user_params) do
        { email: 'user@example.org', password: '123456', name: 'Barney' }
      end

      it { is_expected.to have_http_status(:created) }
      it { is_expected.to have_json_body(user: user_params.except(:password)) }
    end

    context 'with invalid email' do
      let(:user_params) { { email: 'asdf', password: '123456' } }

      it { is_expected.to have_http_status(:unprocessable_entity) }
      it { is_expected.to have_json_body(user: have_key(:errors)) }
    end

    context 'without name' do
      let(:user_params) { { email: 'user@example.org', password: '123456' } }

      it { is_expected.to have_http_status(:created) }
      it { is_expected.to have_json_body(user: have_key(:email)) }
    end
  end
end
