# frozen_string_literal: true

require 'rails_helper'
require 'support/factory_bot'

require 'support/matchers/have_errors_on'

RSpec.describe ErrorsEnvelope do
  subject(:decorated) { described_class.new(model) }

  context 'with invalid model' do
    let(:model) { build(:user, email: nil) }

    it { is_expected.to be_invalid }

    it 'copies errors from given model' do
      decorated.validate

      expect(decorated).to have_errors_on(:email)
    end
  end

  context 'with valid model' do
    let(:model) { build(:category) }

    it { is_expected.to be_valid }
  end
end
