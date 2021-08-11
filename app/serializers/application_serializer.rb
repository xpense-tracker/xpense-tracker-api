# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  attribute :errors, if: -> { object.invalid? }
end
