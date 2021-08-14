# frozen_string_literal: true

module Authentication
  # Authenticates a user and provides their ID
  class IdFromJwt < ApplicationModel
    def initialize(jwt, jwt_codec = JwtCodec.new)
      super()
      @jwt = jwt
      @jwt_codec = jwt_codec
    end

    def to_s
      @jwt_codec.decode(@jwt.to_s)['id']
    end
  end
end
