# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Authentication::Session do
  describe '#access_token' do
    subject(:session) { described_class.new(authenticated_user, jwt_codec) }

    let(:authenticated_user) do
      instance_double('Authentication::AuthenticatedUser', id: 42)
    end
    let(:jwt_codec) do
      instance_double('Authentication::JwtCodec', encode: 'x.y.z')
    end

    it 'encodes user data using given codec' do
      session.access_token

      expect(jwt_codec).to have_received(:encode).with({ id: 42 })
    end
  end
end
