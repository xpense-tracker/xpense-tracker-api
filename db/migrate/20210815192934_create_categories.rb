class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :title
      t.text :description
      t.string :icon_url
      t.references :user, null: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
