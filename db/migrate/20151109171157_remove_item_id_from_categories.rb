class RemoveItemIdFromCategories < ActiveRecord::Migration
  def change
  	remove_column :categories, :item_id, :integer
  	remove_index :categories, :item_id if index_exists?(:categories, :item_id)
  end
end
