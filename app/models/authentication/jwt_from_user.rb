# frozen_string_literal: true

module Authentication
  # Authenticates a user and provides their ID
  class JwtFromUser < ErrorsEnvelope
    def initialize(user, jwt_codec = JwtCodec.new)
      super(user)
      @user = user
      @jwt_codec = jwt_codec
    end

    def to_s
      @jwt_codec.encode(id: @user.id)
    end
  end
end
