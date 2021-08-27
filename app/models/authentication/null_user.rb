# frozen_string_literal: true

module Authentication
  # Fake user
  class NullUser
    def present?
      false
    end

    def id
      raise ActiveRecord::RecordNotFound
    end
  end
end
