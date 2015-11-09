class EditCategoryItems < ActiveRecord::Migration
  def change
  	drop_table :categories_items
  	create_table :categories_items, id: false do |t|
  		t.belongs_to :category, index: true
  		t.belongs_to :item, index: true
  	end
  end
end
