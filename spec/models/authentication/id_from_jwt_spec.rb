# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Authentication::IdFromJwt do
  subject(:id) { described_class.new('x.y.z', jwt_codec) }

  let(:jwt_codec) do
    instance_double('Authentication::JwtCodec', decode: { 'id' => 'some-id' })
  end

  describe '#to_s' do
    subject(:id_string) { id.to_s }

    it { is_expected.to eq('some-id') }
  end
end
