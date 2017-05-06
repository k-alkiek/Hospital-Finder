class User::RegistrationsController < Devise::RegistrationsController
  before_action :reset_session, only: [:new]
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :date_of_birth, :password, :password_confirmation, :image)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :date_of_birth, :current_password, :image)
  end
end