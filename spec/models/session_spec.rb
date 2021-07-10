# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Session do
  subject(:session) { described_class.new({}) }

  describe '#valid?' do
    context 'without email' do
    end

    context 'without password' do
    end

    context 'with wrong password' do
    end

    context 'with correct credentials' do
    end
  end

  describe '#token' do
  end
end
