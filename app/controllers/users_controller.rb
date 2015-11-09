ItemCat = Struct.new(:name,:categoryList)
class UsersController < ApplicationController
	def show
		@user = User.find_by(id: params[:id])
		if @user
			# Only select items that are not in user purchased list
			@recommended = Item.all.select{|item| !(@user.items.include?(item))}
			possibilities = @user.items.map{|i| i.categories}
			userCategories = possibilities.reduce{|a,b| a.concat b}
			@userCatFilter = userCategories.uniq{|item| item.name}.map{|n| n.name}
			#@recommended = @recommended.select{|item| (item.categories & @userCatFilter).length > 0}
			@recommended = @recommended.map{|a| a.categories.map{|b| b.name}}
			#calculate all categories
			purchased = @user.items
			@purchasedList = []
			purchased.each do |p|
				categories = p.categories.map{|a| a.name}
				catList = categories.inject{|cat1, cat2| cat1 + ", " + cat2}
				@purchasedList << ItemCat.new(p.name, catList)
			end
		end
	end
end
