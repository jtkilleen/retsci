class Item < ActiveRecord::Base
	has_and_belongs_to_many :users, -> { distinct }
	has_many :categories, -> { distinct }
end
