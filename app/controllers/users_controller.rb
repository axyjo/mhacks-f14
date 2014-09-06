class UsersController < ApplicationController
	layout "profile"
	def show
		@user = User.find(params[:id])
		render "show"
	end
end
