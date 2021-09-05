# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Authentication::JwtCodec do
  subject(:jwt_codec) { described_class.new(secret) }

  let(:secret) { 'jwt-secret-string' }

  describe '#encode' do
    let(:payload) { { id: 42 } }

    before do
      allow(JWT).to receive(:encode)
    end

    it 'delegates encode to JWT' do
      jwt_codec.encode(payload)

      expect(JWT).to have_received(:encode)
    end
  end

  describe '#decode' do
    let(:token) { 'x.y.z' }

    before do
      allow(JWT).to receive(:decode).and_return([])
    end

    it 'delegates decode to JWT' do
      jwt_codec.decode(token)

      expect(JWT).to have_received(:decode)
    end

    context 'when error occurs' do
      before do
        allow(JWT).to receive(:decode).and_raise(JWT::DecodeError)
      end

      it 'raises InvalidTokenError' do
        expect { jwt_codec.decode(token) }.to(
          raise_error(described_class::InvalidTokenError)
        )
      end
    end
  end
end
