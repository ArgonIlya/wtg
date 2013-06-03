class UsersController < ApplicationController
	def new
	end

	def show
		@user = User.find(params[:id])
		@answer_float = (@user.right * 100 / (@user.right + @user.wrong))
	end

end
