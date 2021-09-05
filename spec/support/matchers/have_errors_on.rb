# frozen_string_literal: true

require 'rspec/expectations'

RSpec::Matchers.define :have_errors_on do |key|
  match do |model|
    model.errors.messages[key].present?
  end
end
