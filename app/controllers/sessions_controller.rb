class SessionsController < ApplicationController
  def new
  	log_out
  end

  def create
  	admin = Admin.find_by(name: params[:session][:name])
  	if admin && admin.authenticate(params[:session][:password])
  		@error = false
  		log_in admin
  		redirect_to root_url
  	else
  		@error = true
  		render 'new'
  	end
  end

  def destroy
  	log_out
    redirect_to "/login"
  end
end
