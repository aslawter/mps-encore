class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      redirect_to [@user, :pending_users]
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to :dashboard
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :first_name,
      :last_name,
    )
  end
end

