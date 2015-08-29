class UsersController < ApplicationController
	def new 
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			@errors = @user.errors.full_messages.uniq
			render :new
		end
	end

	def edit
		find_user_by_id
		redirect_to new_auth_path unless can_edit?
	end

	def update
		find_user_by_id
		if can_edit?
			@user.attributes = user_params
			@user.save(validate: false)
			redirect_to root_path
		else
			redirect_to new_auth_path
		end
	end

	private 

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def can_edit?
		@user && (@user == current_user)
	end

	def find_user_by_id
		@user = User.find_by(id: params[:id])
	end
end