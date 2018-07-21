class SessionsController < ApplicationController

	skip_before_action :logged_in_user
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to :auctions
  	else
      @email = params[:session][:email]
  		flash.now[:danger] = "Invalid email/password combination"
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to login_path
  end

end
