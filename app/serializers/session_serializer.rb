# frozen_string_literal: true

# Serializes Authentication::Session
class SessionSerializer < ApplicationSerializer
  attribute :access_token, if: -> { object.valid? }
end
