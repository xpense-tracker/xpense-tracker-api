# frozen_string_literal: true

require 'rails_helper'
require 'support/factory_bot'

require 'support/shared_contexts/when_user_signed_in'
require 'support/matchers/have_json_body'

RSpec.describe 'Api::V1::Categories' do
  describe 'GET /api/v1/categories' do
    subject(:http_response) do
      get api_v1_categories_path
      response
    end

    before do
      create(:category, title: 'Public category')
      create(:category, :private, title: 'Custom category', user: current_user)
      create(:category, :private, title: 'Private category')
    end

    include_context 'when user signed in'

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to have_json_body(categories: be_an(Array)) }
  end
end
