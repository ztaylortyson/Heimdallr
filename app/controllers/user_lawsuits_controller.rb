class UserLawsuitsController < ApplicationController


	def index
		puts " hello    ZACK  ! ! ! "
		@user_lawsuit = UserLawsuit.create(user_id: params[:user], lawsuit_id: params[:lawsuit])
	end



end
