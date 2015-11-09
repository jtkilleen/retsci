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
			@recommended = @recommended.map{|a| ItemCat.new(a.name, a.categories.map{|b| b.name})}
			@recommended = @recommended.select{|item| (item.categoryList & @userCatFilter).length > 0}
			@recommended.sort!{|a,b| (b.categoryList & @userCatFilter).length <=> (a.categoryList & @userCatFilter).length}
			#@recommended = @recommended.reduce{|a,b| a.concat b}.uniq{|item| item}
			#@recommended = @recommended.select{|item| (item.categories & @userCatFilter).length > 0}
			
			purchased = @user.items
			@purchasedList = []
			purchased.each do |p|
				categories = p.categories.map{|a| a.name}
				#catList = categories.inject{|cat1, cat2| cat1 + ", " + cat2}
				@purchasedList << ItemCat.new(p.name, categories)
			end
		end
	end
end
