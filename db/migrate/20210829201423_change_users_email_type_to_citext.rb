# frozen_string_literal: true

# Change users.email type from text to citext to ignore case
class ChangeUsersEmailTypeToCitext < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :email, :citext
  end

  def down
    change_column :users, :email, :text
  end
end
