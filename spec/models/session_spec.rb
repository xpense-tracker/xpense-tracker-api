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
      before { create(:user, params) }

      let(:params) { { email: 'user@example.org', password: '123456' } }

      it { is_expected.to be_valid }
    end
  end

  describe '#token' do
    # TODO: add specs for Session#token
    pending 'Session#token'
  end
end
