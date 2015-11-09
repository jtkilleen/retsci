class Droptable < ActiveRecord::Migration
  def change
  	drop_table :users_items_tables
  end
end
