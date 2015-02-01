class ProfilesController < ApplicationController
  def edit_password
    @password_form = ChangePasswordForm.new
  end

  def update_password
    @password_form = ChangePasswordForm.new(password_form_params)
    @password_form.user = current_user
    if @password_form.update_password
      redirect_to :auctions
    else 
      render 'edit_password'
    end
  end

	private

		def password_form_params
			params.require(:change_password_form).permit(:current_password, :new_password, :new_password_confirmation)
		end

end
