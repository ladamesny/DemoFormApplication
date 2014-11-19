class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    redirect_to new_user_path

  end

  def edit
    
  end

  def update
    @user.update(user_params)
    redirect_to new_user_path
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end

  private

  def set_user
    @user = User.find(params[:id])
    
  end

  def user_params
    params.require(:user).permit(:name, :review)
  end

end
