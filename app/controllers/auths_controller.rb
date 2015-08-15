class AuthsController < ApplicationController
	def new
	end

	def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      if remember_me?
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      redirect_to root_path
    else
      redirect_to new_auth_path
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path
  end

  private 

  def remember_me?
  	params[:user][:remember_me] == '1'
  end
end