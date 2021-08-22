# frozen_string_literal: true

require 'rails_helper'

require 'support/factory_bot'

RSpec.describe AuthenticatedUser do
  subject(:authenticated_user) { described_class.new(credentials) }

  describe 'validations' do
    context 'when password is missing' do
      let(:credentials) { { email: 'user@example.org' } }

      it 'adds only password errors' do
        authenticated_user.validate

        expect(authenticated_user.errors.messages).to eq(
          password: ["can't be blank"]
        )
      end
    end

    context 'with wrong email' do
      let(:credentials) { { email: 'user@example.org', password: '1234' } }

      it 'raises an error' do
        expect { authenticated_user.validate }.to(
          raise_error(ActiveRecord::RecordNotFound)
        )
      end
    end

    context 'when user exists' do
      let(:credentials) { { email: 'user@example.org', password: '123456' } }

      before { create(:user, credentials) }

      it { is_expected.to be_valid }
    end
  end
end
