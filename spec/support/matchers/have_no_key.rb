# frozen_string_literal: true

RSpec::Matchers.define :have_no_key do |key|
  match do |hash|
    !hash.key?(key)
  end
end
