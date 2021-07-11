# frozen_string_literal: true

require 'rails_helper'

require 'support/factory_bot'

RSpec.describe Session do
  subject(:session) { described_class.new(params) }

  describe '#valid?' do
    context 'without email' do
      let(:params) { { password: '123456' } }

      it { is_expected.to be_invalid }
    end

    context 'without password' do
      let(:params) { { email: 'user@example.org' } }

      it { is_expected.to be_invalid }
    end

    context 'with wrong password' do
      let(:params) { { email: 'user@example.org', password: '123456' } }

      it { is_expected.to be_invalid }
    end

    context 'with correct credentials' do
      let(:params) { { email: 'user@example.org', password: '123456' } }

      before { create(:user, params) }

      it { is_expected.to be_valid }
    end
  end

  describe '#token' do
    subject(:session) { described_class.new(params, fake_jwt_codec) }

    let(:params) { { email: 'user@example.org', password: '123456' } }
    let(:fake_jwt_codec) { instance_double('JwtCodec', encode: 'ey1.2.3') }

    let(:user) { create(:user, params) }

    it 'finds user' do
      expect(fake_jwt_codec).to receive(:encode).with({ id: user.id })

      expect(session.token).to eq('ey1.2.3')
    end
  end
end
