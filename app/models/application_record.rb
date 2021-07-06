# frozen_string_literal: true

# Base class for persisted models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
