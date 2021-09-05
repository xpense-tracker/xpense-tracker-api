# frozen_string_literal: true

# Create Category table
class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :title
      t.text :description
      t.string :icon_url
      t.references(
        :user, null: true, foreign_key: true, type: :uuid, index: false
      )

      t.timestamps

      t.index %i[user_id title], unique: true
    end
  end
end
