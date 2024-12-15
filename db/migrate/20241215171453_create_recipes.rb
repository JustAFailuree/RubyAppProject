class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :instructions
      t.integer :prep_time
      t.integer :servings
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
