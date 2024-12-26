class RemovePriorityFromCategories < ActiveRecord::Migration[7.2]
  def change
    remove_column :categories, :priority, :integer
  end
end
