# frozen_string_literal: true

# Enable gen_random_uuid() function in PostgreSQL
class EnableUuid < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto'
  end
end
