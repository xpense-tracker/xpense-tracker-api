# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction do
  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:transaction)).to be_valid
    end
  end
end
