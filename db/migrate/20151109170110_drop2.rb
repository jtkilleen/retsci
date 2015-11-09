class Drop2 < ActiveRecord::Migration
  def change
  	create_table :categories_items, id: false do |t|
  		t.belongs_to :categories, index: true
  		t.belongs_to :items, index: true
  	end
  end
end
