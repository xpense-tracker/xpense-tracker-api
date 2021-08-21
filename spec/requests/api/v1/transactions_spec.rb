# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Transactions' do
  describe 'GET /index' do
    subject(:http_response) do
      post api_v1_transactions_path
      response
    end

    pending "add some examples (or delete) #{__FILE__}"
  end
end
