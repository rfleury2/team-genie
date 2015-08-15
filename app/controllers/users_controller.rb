class UsersController < ApplicationController
	def new 
		@user = User.new
		@errors = params
	end

	def create
		@user = User.create(user_params)
		@errors = @user.errors
		redirect_to new_user_path(@errors.full_messages)
	end

	private 

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end