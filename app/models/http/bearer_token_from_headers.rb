# frozen_string_literal: true

module Http
  # Extracts authentication token from Authorization HTTP header.
  class BearerTokenFromHeaders < ApplicationModel
    # Happens when no token provided
    class MissingToken < RuntimeError; end

    # Happens when type of token is not Bearer
    class UnsupportedType < RuntimeError; end

    def initialize(headers)
      super()
      @headers = headers
    end

    def to_s
      auth_header = @headers['Authorization']
      raise MissingToken unless auth_header

      type, token = auth_header.split
      raise UnsupportedType unless type == 'Bearer'

      token
    end
  end
end
