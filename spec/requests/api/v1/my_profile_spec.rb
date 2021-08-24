# frozen_string_literal: true

require 'rails_helper'
require 'support/factory_bot'
require 'support/matchers/have_json_body'

RSpec.describe 'Api::V1::MyProfile' do
  describe 'POST /api/v1/my_profile' do
    subject(:http_response) do
      get api_v1_my_profile_path, headers: {
        'Authorization' => "Bearer #{jwt}"
      }
      response
    end

    context 'with valid authorization' do
      let(:jwt) do
        Authentication::Session.new(
          current_user,
          Authentication::JwtCodec.new
        ).access_token
      end
      let(:current_user) { create(:user, profile_data) }
      let(:profile_data) { { email: 'bob@example.org', name: 'Sponge Bob' } }

      it { is_expected.to have_http_status(:ok) }
      it { is_expected.to have_json_body(user: profile_data) }
    end

    # TODO: Enable this test
    xcontext 'with invalid authorization header' do
      let(:jwt) { 'x.y.z' }

      it { is_expected.to have_http_status(:unauthorized) }
      it { is_expected.to have_json_body(error: String) }
    end
  end
end
