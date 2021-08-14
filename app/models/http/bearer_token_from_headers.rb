# frozen_string_literal: true

module Http
  # Extracts authentication token from Authorization HTTP header.
  class BearerTokenFromHeaders < ApplicationModel
    def initialize(headers)
      super()
      @headers = headers
    end

    def to_s
      type, token = @headers['Authorization']&.split
      raise unless type == 'Bearer'

      token
    end
  end
end
