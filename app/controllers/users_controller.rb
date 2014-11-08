class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @user.save(user_params)
    redirect_to root_path
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find_by(params[:id])
  end

  def user_params
    params.required(:user).permit(
    :name,
    :email,
    :password,
    :password_confirm,
    :location)
  end

end
