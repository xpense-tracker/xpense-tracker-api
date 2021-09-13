# frozen_string_literal: true

# Serializes Category
class CategorySerializer < ApplicationSerializer
  attributes :title, :description, :icon_url
end
