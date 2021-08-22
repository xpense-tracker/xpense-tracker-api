# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Session do
  describe '#access_token' do
    subject(:session) { described_class.new(authenticated_user, jwt_codec) }

    let(:authenticated_user) { instance_double('AuthenticatedUser', id: 42) }
    let(:jwt_codec) { instance_double('JwtCodec', encode: 'ey1.2.3') }

    it 'encodes user data using given codec' do
      session.access_token

      expect(jwt_codec).to have_received(:encode).with({ id: 42 })
    end
  end
end
