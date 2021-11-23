# frozen_string_literal: true

# Serializes Authentication::Session
class SessionSerializer < ApplicationSerializer
  type 'session'

  attribute :access_token, if: -> { object.valid? }
end
