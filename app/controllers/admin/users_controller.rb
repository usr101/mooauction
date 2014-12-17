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

  def new 
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to :admin_users
    else 
      render 'edit'
    end
  end

  def create

    @user = User.create(user_params)
    if @user.save
      redirect_to :admin_users
    else
      render 'new'
    end

  end

  private 

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
