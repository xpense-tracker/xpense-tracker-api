# frozen_string_literal: true

require 'rails_helper'
require 'action_policy/rspec/dsl'

RSpec.describe CategoryPolicy do
  let(:user) { build(:user) }
  let(:context) { { user: user } }

  describe_rule :index? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  describe_rule :create? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  describe_rule :manage? do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
