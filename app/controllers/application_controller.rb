class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :logged_in_user
  include SessionsHelper

  private 

  	def logged_in_user
			unless logged_in?
				#flash[:danger] = "Please log in"
				redirect_to login_path
			end
		end

    def logged_in_admin
      unless has_admin_role?
        render file: 'public/401.html', status: :unauthorized
      end
    end

end
