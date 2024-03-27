class UserLawsuitsController < ApplicationController


	def index
		puts " hello    ZACK  ! ! ! "
		@user_lawsuit = UserLawsuit.create(user_id: params[:user], lawsuit_id: params[:lawsuit])
		flash[:notice] = "Tracking new lawsuit on your Portfolio page." 
		redirect_to root_path
	end



end
