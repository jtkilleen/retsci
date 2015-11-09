ItemCat = Struct.new(:name,:categoryList)
class UsersController < ApplicationController
	def show
		if !logged_in?
			redirect_to "/login"
		end
		@user = User.find_by(id: params[:id])
		if @user
			# Only select items that are not in user purchased list
			@recommended = Item.all.select{|item| !(@user.items.include?(item))}
			possibilities = @user.items.map{|i| i.categories}
			@userCategories = possibilities.reduce{|a,b| a.concat b}
			# Names of all the categories relating to the users previously purchased items
			@userCat = @userCategories.uniq{|item| item.name}
			@userCatFilter = @userCategories.uniq{|item| item.name}.flatten.map{|n| n.name}
			@recommended = @recommended.map{|a| ItemCat.new(a.name, a.categories.map{|b| b.name})}
			# Do an intersection between two sets and check if they share at least one category
			@recommended = @recommended.select{|item| (item.categoryList & @userCatFilter).length > 0}
			# Set precedence based on how many categories are shared
			@recommended.sort!{|a,b| (b.categoryList & @userCatFilter).length <=> (a.categoryList & @userCatFilter).length}
			purchased = @user.items
			@purchasedList = []
			purchased.each do |p|
				categories = p.categories.map{|a| a.name}
				@purchasedList << ItemCat.new(p.name, categories)
			end
		end
	end
end
