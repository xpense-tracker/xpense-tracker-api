# frozen_string_literal: true

class SessionSerializer < ApplicationSerializer
  attribute :token, if: -> { object.valid? }
end
