class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
