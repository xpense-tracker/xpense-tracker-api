# frozen_string_literal: true

# Serializes Category
class CategorySerializer < ApplicationSerializer
  type 'category'

  attributes :id, :title, :description, :icon_url
end
