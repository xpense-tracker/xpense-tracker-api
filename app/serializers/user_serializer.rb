# frozen_string_literal: true

# Serializes User
class UserSerializer < ApplicationSerializer
  attributes :email, :name
end
