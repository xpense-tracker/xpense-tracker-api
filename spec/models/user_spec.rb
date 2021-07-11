# frozen_string_literal: true

require 'rails_helper'

require 'support/factory_bot'

RSpec.describe User do
  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end
end
