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

    let(:user_params) { { email: email, password: '123456', name: name } }
    let(:email) { 'user@example.org' }
    let(:name) { 'Barney' }

    context 'with valid data' do
      it { is_expected.to have_http_status(:created) }
      it { is_expected.to have_json_body(user: user_params.except(:password)) }
    end

    context 'with invalid email' do
      let(:email) { 'asdf' }

      it { is_expected.to have_http_status(:unprocessable_entity) }
      it { is_expected.to have_json_body(user: have_key(:errors)) }
    end

    context 'without name' do
      let(:name) { nil }

      it { is_expected.to have_http_status(:created) }
      it { is_expected.to have_json_body(user: have_key(:email)) }
    end
  end
end
