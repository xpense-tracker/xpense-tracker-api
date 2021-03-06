# frozen_string_literal: true

module Authentication
  # Encodes/decodes JSON Web Tokens
  class JwtCodec
    # Happens when failed to decode a token
    class InvalidTokenError < RuntimeError; end

    ALGORITHM = 'HS256'

    def initialize(secret = ENV.fetch('JWT_SECRET'))
      @secret = secret
    end

    def encode(payload)
      JWT.encode(payload, @secret, ALGORITHM)
    end

    def decode(token)
      JWT.decode(token, @secret, true, algorithm: ALGORITHM)[0]
    rescue JWT::DecodeError
      raise InvalidTokenError, I18n.t('errors.authentication.invalid_token')
    end
  end
end
