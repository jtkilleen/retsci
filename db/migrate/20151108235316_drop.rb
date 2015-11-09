class Drop < ActiveRecord::Migration
  def change
  	drop_table :users_items
  	create_table :items_users, id: false do |t|
  		t.belongs_to :user, index: true
  		t.belongs_to :item, index: true
  	end
  end
end
