class ChangePasswordForm
  include ActiveModel::Model

  attr_accessor :current_password, :new_password, :new_password_confirmation, :user

  validates :current_password, presence: true
  validates :new_password, presence: true
  validates :new_password_confirmation, presence: true
  validate :old_password_must_match_current

  def update_password

  	if valid?
  		@user.password = @new_password
  		@user.password_confirmation = @new_password_confirmation
  		if @user.save
  			true
  		else
  			@errors = @user.errors
  			false
  		end
  	else 
  		false
  	end

  end

  private

  	def old_password_must_match_current
  		if !@user.authenticate(@current_password)
  			errors.add(:current_password, "does not match.")
  		end
  	end

end
