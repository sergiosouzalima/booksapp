class AddLikesToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :likes, :integer, default: 0
  end
end
