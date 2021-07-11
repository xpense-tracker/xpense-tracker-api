# frozen_string_literal: true

# Base class for non-persistable models
class ApplicationModel
  include ActiveModel::Model
  include ActiveModel::Serialization
end
