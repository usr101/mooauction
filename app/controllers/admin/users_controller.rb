class Admin::UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def destroy
		@user = User.find(params[:id])

		if @user.destroy
			redirect_to :admin_users
		end
  end

end
