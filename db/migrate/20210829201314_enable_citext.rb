# frozen_string_literal: true

# Enable citext type (case insensitive text)
class EnableCitext < ActiveRecord::Migration[6.1]
  def change
    enable_extension('citext')
  end
end
