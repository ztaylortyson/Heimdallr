class UserClientsController < ApplicationController


	def index
		Rails.logger.info "Check out this info!"
		puts " hello    ZACK  ! ! ! "
		@user_client = UserClient.create(user_id: params[:user], client_id: params[:client])
		flash[:notice] = "Tracking new lawsuit on your Portfolio page." 
		redirect_to root_path
	end



end