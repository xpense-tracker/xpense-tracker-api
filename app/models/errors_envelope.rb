# frozen_string_literal: true

# Base class for models who delegates errors
class ErrorsEnvelope < ApplicationModel
  def initialize(wrappee)
    super()
    @wrappee = wrappee
  end

  validate :wrappee_must_be_valid

  private

  def wrappee_must_be_valid
    return if @wrappee.valid?

    @wrappee.errors.messages.each do |attr, errors|
      errors.each { |error| self.errors.add(attr, error) }
    end
  end
end
