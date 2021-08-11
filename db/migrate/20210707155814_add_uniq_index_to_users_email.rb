# frozen_string_literal: true

# Adds unique index to users.email
class AddUniqIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true
  end
end
