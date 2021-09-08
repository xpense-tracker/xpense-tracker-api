# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Authentication::Session do
  describe '#access_token' do
    subject(:session) { described_class.new(jwt) }

    let(:jwt) do
      instance_double('Authentication::JwtFromUser', to_s: 'x.y.z')
    end

    it 'encodes user data using given codec' do
      session.access_token

      expect(jwt).to have_received(:to_s)
    end
  end
end
