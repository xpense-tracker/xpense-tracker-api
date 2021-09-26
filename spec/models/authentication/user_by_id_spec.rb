# frozen_string_literal: true

require 'rails_helper'

require 'support/factory_bot'

RSpec.describe Authentication::UserById do
  let(:user) { described_class.new(id) }

  describe '#to_model' do
    context 'when user with given id exists' do
      let(:user_from_database) { create(:user) }
      let(:id) { user_from_database.id }

      it 'returns user from database' do
        expect(user.to_model).to eq(user_from_database)
      end
    end

    context 'when there is no user with such id' do
      let(:id) { 'some-id' }

      it 'raises error' do
        expect { user.to_model }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
