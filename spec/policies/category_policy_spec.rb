# frozen_string_literal: true

require 'rails_helper'
require 'action_policy/rspec/dsl'
require 'support/factory_bot'

RSpec.describe CategoryPolicy do
  let(:user) { build(:user) }
  let(:context) { { user: user } }

  describe_rule :index? do
    succeed 'unconditionally'
  end

  describe '#relation_scope' do
    subject(:relation_scope) do
      policy.apply_scope(Category.all, type: :active_record_relation)
    end

    it 'includes only owned and public categories' do
      _private_category = create(:category, :private)
      public_category = create(:category)
      owned_category = create(:category, :private, user: user)

      expect(relation_scope).to match_array([public_category, owned_category])
    end
  end
end
