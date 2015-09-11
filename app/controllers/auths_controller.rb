class AuthsController < ApplicationController
	def new
	end

	def create
    @user = User.find_by(email: params[:user][:email])
    if can_authenticate?
    	assign_cookie
      redirect_to teams_path
    else
    	@errors = error_message
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path
  end

  def facebook_auth
    @user = User.from_facebook(env['omniauth.auth'])
    if @user
      assign_cookie
      redirect_to root_path
    else
      @user = User.create_from_facebook(env['omniauth.auth'])
      assign_cookie
      redirect_to edit_user_path(@user)
    end
  end

  private 

  def remember_me?
  	params[:user] && params[:user][:remember_me] == '1'
  end

  def assign_cookie
  	if remember_me?
  	  cookies.permanent[:auth_token] = @user.auth_token
  	else
  	  cookies[:auth_token] = @user.auth_token
  	end
  end

  def can_authenticate?
  	@user && @user.authenticate(params[:user][:password])
  end

  def error_message
  	["Your email or password are incorrect.  Please try again"]
  end
end