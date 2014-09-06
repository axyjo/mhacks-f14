class UsersController < ApplicationController
	def show
		@user = User.preload(:publications).find(params[:id])
		render "show"
	end
end
