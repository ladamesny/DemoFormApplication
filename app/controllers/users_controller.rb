class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html {redirect_to new_user_path}
        format.js
      end
    end
  end

  def edit
    
  end

  def update
    @user.update(user_params)
    redirect_to new_user_path
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to new_user_path}
      format.js
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    
  end

  def user_params
    params.require(:user).permit(:name, :review)
  end

end
