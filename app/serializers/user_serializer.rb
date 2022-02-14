# frozen_string_literal: true

# Serializes User
class UserSerializer < ApplicationSerializer
  type 'user'

  attributes :email, :name
end
