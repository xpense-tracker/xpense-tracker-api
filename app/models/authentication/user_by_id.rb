# frozen_string_literal: true

module Authentication
  # Finds a user by its ID
  class UserById < ApplicationModel
    def initialize(id)
      super()
      @id = id
    end

    def to_model
      User.find(@id.to_s)
    end
  end
end
