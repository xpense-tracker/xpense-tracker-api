# frozen_string_literal: true

module Http
  # Extracts authentication token from Authorization HTTP header.
  class BearerTokenFromHeaders < ApplicationModel
    class MissingToken < RuntimeError; end

    class UnsupportedType < RuntimeError; end

    def initialize(headers)
      super()
      @headers = headers
    end

    def to_s
      auth_header = @headers['Authorization']

      raise MissingToken, I18n.t('errors.http.missing_token') unless auth_header

      type, token = auth_header.split

      unless type == 'Bearer'
        raise UnsupportedType, I18n.t('errors.http.unsupported_token_type')
      end

      token
    end
  end
end
