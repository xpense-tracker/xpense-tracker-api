# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Http::BearerTokenFromHeaders do
  subject(:token) { described_class.new(headers) }

  let(:headers) { { 'Authorization' => 'Bearer x.y.z' } }

  describe '#to_s' do
    subject(:token_as_string) { token.to_s }

    it { is_expected.to eq('x.y.z') }

    context 'when credentials type is not Bearer' do
      let(:headers) { { 'Authorization' => 'Basic x.y.z' } }

      it 'raises an error' do
        expect { token_as_string }.to raise_error(
          described_class::UnsupportedType
        )
      end
    end

    context 'when Authorization header is missing' do
      let(:headers) { {} }

      it 'raises an error' do
        expect { token_as_string }.to raise_error(described_class::MissingToken)
      end
    end
  end
end
