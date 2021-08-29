# frozen_string_literal: true

require 'rspec/expectations'

# Tests JSON response body with given matcher
RSpec::Matchers.define :have_json_body do |body_matcher|
  match do |response|
    response_body = JSON.parse(response.body).with_indifferent_access
    expect(response_body).to match(body_matcher)
  end

  failure_message do |response|
    format(
      'expected %<response>s to match %<matcher>s',
      response: response.body,
      matcher: match(body_matcher).expected_formatted
    )
  end
end
