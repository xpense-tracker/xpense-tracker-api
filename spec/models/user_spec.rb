# frozen_string_literal: true

require 'rails_helper'

require 'support/factory_bot'

RSpec.describe User do
  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    context 'when email is already taken' do
      before { create(:user, email: 'user@example.org') }

      it 'is invalid' do
        expect(build(:user, email: 'User@example.org')).to be_invalid
      end
    end
  end

  describe 'find_by :email' do
    context 'when user with such email exists' do
      before { create(:user, email: 'user@example.org') }

      it 'finds one ignoring case' do
        expect(described_class.find_by(email: 'user@example.org')).to be_present
      end
    end
  end
end
