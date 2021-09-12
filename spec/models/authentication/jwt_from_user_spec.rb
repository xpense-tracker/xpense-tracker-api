# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Authentication::JwtFromUser do
  describe '#to_s' do
    subject(:jwt) { described_class.new(user, jwt_codec).to_s }

    let(:user) { build(:user, id: '42') }
    let(:jwt_codec) do
      instance_double('Authentication::JwtCodec', encode: 'x.y.z')
    end

    it { is_expected.to eq('x.y.z') }
  end
end
