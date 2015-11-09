class AddItemToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :item, index: true, foreign_key: true
  end
end
