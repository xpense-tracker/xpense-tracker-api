# frozen_string_literal: true

class SessionSerializer < ApplicationSerializer
  attribute :access_token, if: -> { object.valid? }
end
