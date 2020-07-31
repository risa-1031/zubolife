class UsersController < ApplicationController

  # before_action :user_sign_in


  def index
    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
  end

  # def new
    # @user = User.new
    # - if user.save
    #   redirect_to new_group_path
    # - else
    #   redirect_to root_path
    # end
  # end

  # def create
  #   @users = @user
  #   if 
  #     redirect_to root_path
  #   else
  #     redirect_to new_user_registration_path
  #   end
  # end

  # def show
  #   user = User.find(params[:id])
  #   @contents = user.contents
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  # def user_log_in
  #   @group_new = redirect_to new_group_path
  # end

end
