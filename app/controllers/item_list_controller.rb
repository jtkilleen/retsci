class ItemListController < ApplicationController
  def home
  	@admin = Admin.find_by(name: "Jeff Killeen")
  	@users = User.all
  end
end
