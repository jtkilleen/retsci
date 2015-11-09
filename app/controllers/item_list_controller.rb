class ItemListController < ApplicationController
  def home
  	#@admin = Admin.find_by(id: "Jeff Killeen")
  	if !logged_in?
		redirect_to "/login"
	end
  	@users = User.all
  end
end
