# frozen_string_literal: true

# Base class for serializers that provides errors
class ApplicationSerializer < ActiveModel::Serializer
  attribute :errors, if: -> { object.respond_to?(:invalid?) && object.invalid? }
end
