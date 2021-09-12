# frozen_string_literal: true

module Authentication
  # Contains a token to identify a user
  class Session < ErrorsEnvelope
    def initialize(access_token)
      super(access_token)
      @access_token = access_token
    end

    def access_token
      @access_token.to_s
    end
  end
end
