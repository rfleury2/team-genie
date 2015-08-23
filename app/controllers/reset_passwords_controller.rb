class ResetPasswordsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user.send_password_reset if user
    redirect_to root_url
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if token_expired? 
      redirect_to new_password_reset_path
    elsif @user.update_attributes(user_params)
      @user.save!(validate: false)
      redirect_to root_url(password_reset: true)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def token_expired?
    @user.password_reset_sent_at < 2.days.ago
  end

end