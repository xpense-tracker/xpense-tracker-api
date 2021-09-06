# frozen_string_literal: true

RSpec::Matchers.define :with_size do |expected_size|
  match do |array|
    array.size == expected_size
  end
end
