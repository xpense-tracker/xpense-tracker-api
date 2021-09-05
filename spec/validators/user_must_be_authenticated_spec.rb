# frozen_string_literal: true

require 'rails_helper'

require 'support/matchers/have_errors_on'

# Class for testing UserMustBeAuthenticated validator
UserContext = Struct.new(:user, :email, :password, :other_field) do
  include ActiveModel::Validations

  validates :email, :password, presence: true
  validates :other_field, presence: true
  validates_with UserMustBeAuthenticated
end

RSpec.describe UserMustBeAuthenticated do
  subject(:model) { UserContext.new(user, email, password).tap(&:validate) }

  let(:user) { :some_user }
  let(:email) { 'test@example.org' }
  let(:password) { '123456' }
  let(:other_field) { :some_value }

  context 'when model has other errors' do
    let(:user) { nil }

    context 'with errors on :email' do
      let(:email) { '' }

      it { is_expected.not_to have_errors_on(:base) }
    end

    context 'with errors on :password' do
      let(:password) { nil }

      it { is_expected.not_to have_errors_on(:base) }
    end

    context 'with errors on other fields' do
      let(:other_field) { '' }

      it { is_expected.to have_errors_on(:base) }
    end
  end

  context 'without other errors' do
    context 'when user is present' do
      let(:user) { :some_user }

      it { is_expected.not_to have_errors_on(:base) }
    end

    context 'when no user is present' do
      let(:user) { nil }

      it { is_expected.to have_errors_on(:base) }
    end
  end
end
