# frozen_string_literal: true

require 'rspec/expectations'

# Tests JSON response body with given matcher
RSpec::Matchers.define :have_json_body do |body_matcher|
  match do |response|
    expect(response.parsed_body.with_indifferent_access).to match(body_matcher)
  end

  failure_message do |response|
    format(
      'expected %<response>s to match %<matcher>s',
      response: response.parsed_body,
      matcher: match(body_matcher).expected_formatted
    )
  end
end
