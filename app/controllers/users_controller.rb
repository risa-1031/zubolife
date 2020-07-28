class UsersController < ApplicationController
  def index
    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
  end

  def new
    @user = User.new
  end

  def create
    @users = @user
    if current_user.Create.new
      redirect_to new_group_path
    else
      redirect_to new_user_registration_path
    end
  end

  def show
    user = User.find(params[:id])
    @contents = user.contents
  end
end
